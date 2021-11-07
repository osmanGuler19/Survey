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

  Future<void> AddUser(String email, String password, String fname, String lname) async {
    try {
      QState.BUSY;
      final MutationOptions options = MutationOptions(
          document: gql(addUser(fname, lname, email, password)
          ),
          variables: {
            "name": fname,
            "surname": lname,
            "email": email,
            "password": password,
            
          });

      GraphQLClient client = await getClient();
      final QueryResult result = await client.mutate(options);
      _user = User.fromJson(result.data!['addUser']);
      notifyListeners();
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
      if (result.hasException) {
        _state = QState.ERROR;
        return null;
      }
      if (result.data == null) {
        _state = QState.ERROR;
        return null;
      }
      if (result.data!['getUser'] == null) {
        _state = QState.ERROR;
        return null;
      }
      if (result.data!['getUser']['user'] == null) {
        _state = QState.ERROR;
        return null;
      }
      _user = User.fromJson(result.data!['getUser']['user']);
      _state = QState.DEFAULT;
      return _user;
    } catch (e) {
      print(e);
      _state = QState.ERROR;
      return null;
    }
    
  }
}
