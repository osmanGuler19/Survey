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

  Future<void> AddUser(
      String email, String password, String fname, String lname) async {
    try {
      print(addUser("osman", "guler", "opasdas", "asdasd"));
      print(email + " " + password + " " + fname + " " + lname);
      QState.BUSY;
      final MutationOptions options = MutationOptions(
        document: gql(addUser(fname, lname, email, password)),
        variables: <String, dynamic>{
          'email': email,
          'passw': password,
          'name': fname,
          'surname': lname,
        },
      );

      GraphQLClient client = await getClient();
      print(client);
      final QueryResult result = await client.mutate(options);
      //Getting the result. You have to watch out the return order and types. It changes with every query.
      _user = User.fromJson(result.data!['createUsers']['users'][0]);
      notifyListeners();
      _state = QState.IDLE;
    } catch (e) {
      print(e);
      _state = QState.ERROR;
    }
  }

  Future<User?> getUser(String email, String password) async {
    try {
      QState.BUSY;
      final QueryOptions options = QueryOptions(
          document: gql(getUserByEmail(email, password)),
          fetchPolicy: FetchPolicy.networkOnly);

      GraphQLClient client = await getClient();
      final QueryResult result = await client.query(options);
      print(result.data.toString());
      _user = User.fromJson(result.data!['users'][0]);
      if (result.hasException) {
        _state = QState.ERROR;
        return null;
      }
      if (result.data == null) {
        _state = QState.ERROR;
        return null;
      }
      _state = QState.IDLE;
      return _user;
    } catch (e) {
      print(e);
      _state = QState.ERROR;
      return null;
    }
  }
}
