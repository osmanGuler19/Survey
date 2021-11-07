import 'package:client_flutter/viewmodel/questionModelView.dart';
import 'package:client_flutter/viewmodel/userModelView.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client_flutter/services/gql.dart';
import 'package:provider/provider.dart';
import 'view/question.dart';
import 'view/login.dart';
import 'view/signin.dart';
import 'view/landing_page.dart';
void main() async {
  //await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<questionModelView>(create: (_) => questionModelView()),
        ChangeNotifierProvider<userModelView>(create: (_) => userModelView()),
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
          '/': (context) => LandingPage(),
          //'/users': (context) => UserListScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
