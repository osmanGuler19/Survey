import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/myModel.dart';
import 'package:flutter/foundation.dart';
import '../services/gql.dart';
import '../queries/queryStrings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

enum QState { IDLE, BUSY, ERROR, DEFAULT }

class myModelView extends ChangeNotifier {
  late QState _state ;

  late List<Question> questionList ;
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
    try {
      state = QState.BUSY;
      final QueryOptions options = QueryOptions(
        document: gql(getAllQuestions()),
      );
      GraphQLClient client = await getClient();
      final QueryResult result = await client.query(options);

      //var QuestionJson = jsonDecode(result.data)['questions'] as List;
      //map((qjson) => Question.fromJson(qjson))
      //List data = result.data!['questions']
      List<Question> questions = [];
      questions = result.data!['questions'](List)
          .map((qjson) => Question.fromJson(qjson))
          .toList();
      questionList = result.data!['questions'](List)
          .map((qjson) => Question.fromJson(qjson))
          .toList();
      state = QState.IDLE;
      print(questionList);
      return questions;
    } catch (e) {
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