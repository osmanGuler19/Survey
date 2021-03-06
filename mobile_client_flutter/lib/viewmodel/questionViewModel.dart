import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:json_helpers/json_helpers.dart';
import '../model/myModel.dart';
import 'package:flutter/foundation.dart';
import '../services/gql.dart';
import '../queries/queryStrings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'componentScopeViewModel.dart';

enum QState { IDLE, BUSY, ERROR, DEFAULT }

class QuestionViewModel extends ChangeNotifier {
  late QState q_state;

  late List<Question> questionList;

  late Map<String, List<Question>> questionMap;
  late Map<String, List<TextEditingController>> textEditingControllerMap;
  int i = 0;

  QuestionViewModel() {
    questionList = [];

    questionMap = {};
    textEditingControllerMap = {};
    q_state = QState.IDLE;
    fetchQuestions();
  }

  bool isLastQuestion() {
    if (i == questionList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void nextQuestion() {
    if (i < questionList.length - 1) {
      i++;
      notifyListeners();
    }
  }

  void preQuestion() {
    if (i > 0) {
      i--;
      notifyListeners();
    }
  }

  QState get state => q_state;

  set state(QState state) {
    q_state = state;
    notifyListeners();
  }

  // String type must be like "component && scope"
  List<Question> getQuestionsByComponentScope(String componentScope) {
    return questionMap[componentScope]!;
  }

  Future<void> fetchQuestions() async {
    try {
      q_state = QState.BUSY;
      final QueryOptions options = QueryOptions(
        document: gql(getAllQuestions()),
      );
      GraphQLClient client = await getClient();
      final QueryResult result = await client.query(options);
      q_state = QState.IDLE;
      List<dynamic> qs = result.data!["questions"] as List<dynamic>;
      for (int ind = 0; ind < qs.length; ind++) {
        Question temp = Question.fromJson(qs[ind]);
        questionList.add(temp);
        String scopeComponent =
            temp.component.label + " && " + temp.scope.label;
        TextEditingController controller = new TextEditingController();
        if (questionMap.containsKey(scopeComponent)) {
          questionMap[scopeComponent]!.add(temp);
          textEditingControllerMap[scopeComponent]!.add(controller);
        } else {
          questionMap[scopeComponent] = [temp];
          textEditingControllerMap[scopeComponent] = [controller];
        }
      }
      print("QuestionMap : ");
      print(questionMap["Project && Actors/Agents"]);
      notifyListeners();
    } catch (e) {
      print(e);
      q_state = QState.ERROR;
    }
  }

  Future<void> goToQuestion(int index) async {
    i = index;
    notifyListeners();
  }
}



/*
  void fillTheMatrix() {
    List<Component> compList = [];

    List<Scope> scopeList = [];
    // Will be slow as fuck
    for (int i = 0; i < questionList.length; i++) {
      if (questionList[i].component != null &&
          !compList.contains(questionList[i].component)) {
        compList.add(questionList[i].component);
      }
      if (questionList[i].scope != null &&
          !scopeList.contains(questionList[i].scope)) {
        scopeList.add(questionList[i].scope);
      }
    }
  }
*/