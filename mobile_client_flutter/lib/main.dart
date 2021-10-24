import 'package:client_flutter/viewmodel/myModelView.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client_flutter/services/gql.dart';
import 'package:provider/provider.dart';
import 'view/question.dart';
import 'view/login.dart';
import 'view/signin.dart';

void main() async {
  //await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<myModelView>(create: (_) => myModelView())
      ],
      child: MaterialApp(
        title: 'GrandStack Flutter',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.pinkAccent),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SignInPage(),
          //'/users': (context) => UserListScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
