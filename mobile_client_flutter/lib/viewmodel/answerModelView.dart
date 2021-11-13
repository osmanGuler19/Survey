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
  late Answer answer;
  late AState _state;
  AnswerViewModel() {
    _state = AState.DEFAULT;
  }

  void setState(AState state) {
    this._state = state;
    notifyListeners();
  }

  AState getState() {
    return this._state;
  }

  Future<void> AddAnswer(int order, String response, Survey survey) async {
    try {
      setState(AState.BUSY);
      final MutationOptions options = MutationOptions(
        document: gql(addAnswer(order, response, survey.survey_id)),
      );

      GraphQLClient client = await getClient();

      final QueryResult result = await client.mutate(options);

      if (result.hasException) {
        print(result.exception.toString());
        setState(AState.ERROR);
      }
      answer = Answer.fromJson(result.data!['createAnswers']['answers'][0]);
    } catch (e) {
      print(e);
      _state = AState.ERROR;
    }
  }
}
