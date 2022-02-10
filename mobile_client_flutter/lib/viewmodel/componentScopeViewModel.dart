import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/myModel.dart';
import 'package:flutter/foundation.dart';
import '../services/gql.dart';
import '../queries/queryStrings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

enum ComponentScopeState { IDLE, BUSY, ERROR, DEFAULT }

class ComponentAndScopeViewModel extends ChangeNotifier {
  late ComponentScopeState q_state;

  late List<Scope> scopeList;
  late List<Component> componentList;
  int satir = 0; //Component'ler
  int sutun = 0; //Scope'lar

  void nextQuestion() {
    for (int i = 0; i < componentList.length; i++) {
      print("Components : " + componentList[i].label);
    }
    if (satir == componentList.length - 1 && sutun == scopeList.length - 1) {
      print("Satir ;" + satir.toString() + " Sutun : " + sutun.toString());
      return;
    }
    if (sutun < scopeList.length - 1) {
      sutun++;
      notifyListeners();
      print("Satir ;" + satir.toString() + " Sutun : " + sutun.toString());
      return;
    }
    if (sutun == scopeList.length - 1 && satir < componentList.length - 1) {
      sutun = 0;
      satir++;
      print("Satir ;" + satir.toString() + " Sutun : " + sutun.toString());
    }
    notifyListeners();
  }

  void previousQuestion() {
    if (satir == 0 && sutun == 0) {
      notifyListeners();
      return;
    }
    if (sutun > 0) {
      sutun--;
      notifyListeners();
      return;
    }
    if (sutun == 0) {
      sutun = scopeList.length - 1;
      satir--;
    }
    notifyListeners();
  }

  String getCurrentQuestionKey() {
    return componentList[satir].label + " && " + scopeList[sutun].label;
  }

  bool isLastMatrix() {
    if (satir == componentList.length - 1 && sutun == scopeList.length - 1) {
      return true;
    }
    return false;
  }

  ComponentAndScopeViewModel() {
    scopeList = [];
    componentList = [];
    q_state = ComponentScopeState.IDLE;
    fetchComponentAndScopes();
  }

  ComponentScopeState get state => q_state;

  set state(ComponentScopeState state) {
    q_state = state;
    notifyListeners();
  }

  Future<void> fetchComponentAndScopes() async {
    try {
      q_state = ComponentScopeState.BUSY;
      final QueryOptions options = QueryOptions(
        document: gql(getScopes()),
      );
      GraphQLClient client = await getClient();
      final QueryResult result = await client.query(options);

      q_state = ComponentScopeState.IDLE;
      List<dynamic> qs = result.data!["scopes"] as List<dynamic>;
      scopeList = qs.map((dynamic item) => Scope.fromJson(item)).toList();

      final QueryOptions options2 = QueryOptions(
        document: gql(getComponents()),
      );
      GraphQLClient client2 = await getClient();
      final QueryResult result2 = await client2.query(options2);
      List<dynamic> qs2 = result2.data!["components"] as List<dynamic>;
      componentList =
          qs2.map((dynamic item) => Component.fromJson(item)).toList();
      q_state = ComponentScopeState.IDLE;
      notifyListeners();
    } catch (e) {
      print(e);

      q_state = ComponentScopeState.ERROR;
    }
  }

  List<Component> getComponentsList() {
    return componentList;
  }

  List<Scope> getScopesList() {
    return scopeList;
  }
}
