import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/myModel.dart';
import 'package:flutter/foundation.dart';
import '../services/gql.dart';
import '../queries/queryStrings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

enum AState { IDLE, BUSY, ERROR, DEFAULT }

class AnswerViewModel extends ChangeNotifier {
  int answerOrder = 0;
  int ind = 0;
  late Answer answer;
  late AState a_state;
  late List<Answer> answers;
  AnswerViewModel() {
    answers = [];
    this.a_state = AState.DEFAULT;
  }

  void increaseInd() {
    ind++;
    notifyListeners();
  }

  void setState(AState state) {
    this.a_state = state;
    notifyListeners();
  }

  void addAnswerToList(Answer ans) {
    answers.add(ans);
    answerOrder++;
  }

  AState getState() {
    return this.a_state;
  }

  Future<void> AddAnswer(int order, String response, Survey survey,Question question) async {
    print(survey.survey_id);
    try {
      setState(AState.BUSY);
      final MutationOptions options = MutationOptions(
        document: gql(addAnswer(order, response, survey.survey_id,question.text)),
      );

      GraphQLClient client = await getClient();

      final QueryResult result = await client.mutate(options);

      if (result.hasException) {
        print(result.exception.toString());
        setState(AState.ERROR);
      }
      //Don't need query result
      //answers[ind] =Answer.fromJson(result.data!['createAnswers']['answers'][0]);
      increaseInd();
    } catch (e) {
      print(e);
      a_state = AState.ERROR;
    }
  }
}
