import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:json_helpers/json_helpers.dart';
import '../model/myModel.dart';
import 'package:flutter/foundation.dart';
import '../services/gql.dart';
import '../queries/queryStrings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

enum QState { IDLE, BUSY, ERROR, DEFAULT }

class myModelView extends ChangeNotifier {
  late QState _state;

  late List<Question> questionList;
  int i = 0;

  myModelView() {
    questionList = [];
    _state = QState.IDLE;
    fetchQuestions();
  }

  void nextQuestion() {
    i++;
    notifyListeners();
  }

  void preQuestion() {
    i--;
    notifyListeners();
  }

  QState get state => _state;
  set state(QState state) {
    _state = state;
    notifyListeners();
  }

  Future<List<Question>> fetchQuestions() async {
    print("try öncesi");

    try {
      print("başlangıç");
      state = QState.BUSY;
      final QueryOptions options = QueryOptions(
        document: gql(getAllQuestions()),
      );
      print("client öncesi");
      GraphQLClient client = await getClient();
      print("client sonrası");
      final QueryResult result = await client.query(options);
      print("result : ${result.data!["questions"]}");
      List<Question> questions = [];
      state = QState.IDLE;
      List<dynamic> qs = result.data!["questions"] as List<dynamic>;
      for (int ind = 0; ind < qs.length; ind++) {
        Question temp = Question.fromJson(qs[ind]);
        questions.add(temp);
        questionList.add(temp);
      }
      notifyListeners();
      return questions;
    } catch (e) {
      print(e);
      state = QState.ERROR;
      return [];
    }
  }
}

/*
Query(
          options: QueryOptions(document: gql(getAllQuestions())),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              return Center(
                child: Text(result.exception.toString()),
              );
            }
            if (result.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Text()
          });

*/