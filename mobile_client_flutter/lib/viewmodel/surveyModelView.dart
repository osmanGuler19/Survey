import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/myModel.dart';
import 'package:flutter/foundation.dart';
import '../services/gql.dart';
import '../queries/queryStrings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

enum S_State { IDLE, BUSY, ERROR, DEFAULT }

class SurveyViewModel extends ChangeNotifier {
  int answerOrder = 0;
  late Survey survey;
  late S_State _state;
  AnswerViewModel() {
    _state = S_State.DEFAULT;
  }

  void setState(S_State state) {
    this._state = state;
    notifyListeners();
  }

  S_State getState() {
    return this._state;
  }

  // Time should be sent as format at MM/DD/YYYY
  // like 2021-11-13T00:00:00+03:00

  Future<void> 
    AddSurvey(String survey_id,String title,String description,List<Answer> answers, DateTime create_time, DateTime update_time, User user) async {
    try {
      setState(S_State.BUSY);
      final MutationOptions options = MutationOptions(
        document: gql(addSurvey(survey_id, title, description,create_time.toString(), update_time.toString(), user.email)),
      );

      GraphQLClient client = await getClient();

      final QueryResult result = await client.mutate(options);

      if (result.hasException) {
        print(result.exception.toString());
        setState(S_State.ERROR);
      }
      survey = Survey.fromJson(result.data!['createSurveys']['surveys'][0]);
    } catch (e) {
      print(e);
      _state = S_State.ERROR;
    }
  }
}
