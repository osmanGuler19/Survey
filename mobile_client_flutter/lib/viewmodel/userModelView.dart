import '../model/myModel.dart';
import 'package:flutter/foundation.dart';
import '../services/gql.dart';
import '../queries/queryStrings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

enum QState { IDLE, BUSY, ERROR, DEFAULT }

class userModelView extends ChangeNotifier {
  late User _user;
  late QState _state;
  userModelView() {
    _state = QState.IDLE;
  }

  AddUser(String email, String password,String fname, String lname) async {
    try {
      QState.BUSY;
      final MutationOptions options =
          MutationOptions(document: gql(AddUser(fname, lname, email, password)));

      GraphQLClient client = await getClient();
      final QueryResult result = await client.mutate(options);
    } catch (e) {
      print(e);
      _state = QState.ERROR;
    }
  }
}
