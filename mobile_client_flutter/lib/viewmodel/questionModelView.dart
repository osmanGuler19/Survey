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

class questionModelView extends ChangeNotifier {
  late QState _state;

  late List<Question> questionList;
  int i = 0;

  questionModelView() {
    questionList = [];
    _state = QState.IDLE;
    fetchQuestions();
  }

  bool isLastQuestion(){
    if(i==questionList.length-1){
      return true;
    }
    else{
      return false;
    }
  }

  void nextQuestion() {
    if(i<questionList.length-1){
      i++;
      notifyListeners();
    }  
  }

  void preQuestion() {
    if(i>0){
      i--;
      notifyListeners();
    }
  }

  QState get state => _state;
  set state(QState state) {
    _state = state;
    notifyListeners();
  }

  Future<List<Question>> fetchQuestions() async {
    try {
      state = QState.BUSY;
      final QueryOptions options = QueryOptions(
        document: gql(getAllQuestions()),
      );
      GraphQLClient client = await getClient();
      final QueryResult result = await client.query(options);
      //print("result : ${result.data!["questions"]}");
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

