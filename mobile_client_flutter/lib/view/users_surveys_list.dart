import 'package:client_flutter/viewmodel/surveyViewModel.dart';
import 'package:flutter/material.dart';
import '../viewmodel/userViewModel.dart';
import 'package:provider/provider.dart';

class UserSurveyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vms = Provider.of<SurveyViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('User\'s Survey List')),
      ),
      body: ListView.builder(
          itemCount: vms.userSurveys.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(vms.userSurveys[index].title),
              subtitle: Text(vms.userSurveys[index].description),
              trailing: Icon(Icons.keyboard_arrow_right),
            );
          }),
    );
  }
}
