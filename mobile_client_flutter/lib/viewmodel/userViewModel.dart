import '../model/myModel.dart';
import 'package:flutter/foundation.dart';
import '../services/gql.dart';
import '../queries/queryStrings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

enum UState { IDLE, BUSY, ERROR, DEFAULT }

class UserViewModel extends ChangeNotifier {
  late User user;
  late UState u_state;
  userModelView() {
    u_state = UState.IDLE;
  }

  Future<void> AddUser(
      String email, String password, String fname, String lname) async {
    try {
      print(addUser("osman", "guler", "opasdas", "asdasd"));
      print(email + " " + password + " " + fname + " " + lname);
      u_state = UState.BUSY;
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
      user = User.fromJson(result.data!['createUsers']['users'][0]);
      notifyListeners();
      u_state = UState.IDLE;
    } catch (e) {
      print(e);
      u_state = UState.ERROR;
    }
  }

  Future<User?> getUser(String email, String password) async {
    try {
      u_state=UState.BUSY;
      final QueryOptions options = QueryOptions(
          document: gql(getUserByEmail(email, password)),
          fetchPolicy: FetchPolicy.networkOnly);

      GraphQLClient client = await getClient();
      final QueryResult result = await client.query(options);
      print(result.data.toString());
      user = User.fromJson(result.data!['users'][0]);
      if (result.hasException) {
        u_state = UState.ERROR;
        return null;
      }
      if (result.data == null) {
        u_state = UState.ERROR;
        return null;
      }
      u_state = UState.IDLE;
      return user;
    } catch (e) {
      print(e);
      u_state = UState.ERROR;
      return null;
    }
  }
}
