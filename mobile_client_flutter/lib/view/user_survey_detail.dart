import 'package:client_flutter/viewmodel/surveyViewModel.dart';
import 'package:flutter/material.dart';
import '../viewmodel/userViewModel.dart';
import 'package:provider/provider.dart';
import '../model/myModel.dart';

class UserSurveyDetailPage extends StatelessWidget {
  final Survey survey;
  UserSurveyDetailPage({Key? key, required this.survey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Survey Detail'),
      ),
      body: Container(
        child: Text('SELAMLAR'),
      ),
    );
  }
}
