import 'package:client_flutter/viewmodel/questionViewModel.dart';
import 'package:client_flutter/viewmodel/userViewModel.dart';
import 'package:client_flutter/viewmodel/answerViewModel.dart';
import 'package:client_flutter/viewmodel/surveyViewModel.dart';
import 'package:client_flutter/viewmodel/componentScopeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client_flutter/services/gql.dart';
import 'package:provider/provider.dart';
import 'view/question.dart';
import 'view/login.dart';
import 'view/signin.dart';
import 'view/users_surveys_list.dart';
import 'view/user_landing.dart';
import 'view/landing_page.dart';
import 'view/first_landing_page.dart';

void main() async {
  //await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<QuestionViewModel>(
            create: (_) => QuestionViewModel()),
        ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
        ChangeNotifierProvider<AnswerViewModel>(
            create: (_) => AnswerViewModel()),
        ChangeNotifierProvider<SurveyViewModel>(
            create: (_) => SurveyViewModel()),
        ChangeNotifierProvider<ComponentAndScopeViewModel>(
            create: (_) => ComponentAndScopeViewModel()),
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
