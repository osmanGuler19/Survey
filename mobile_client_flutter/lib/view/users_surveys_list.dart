import 'package:client_flutter/viewmodel/surveyViewModel.dart';
import 'package:flutter/material.dart';
import '../viewmodel/userViewModel.dart';
import 'package:provider/provider.dart';
import 'user_survey_detail.dart';

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
            return Container(
              width: getWidth(context, MediaQuery.of(context).orientation),
              child: ListTile(
                title: Text(vms.userSurveys[index].title),
                subtitle: Text(vms.userSurveys[index].created_at.toString()),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserSurveyDetailPage(
                            survey: vms.userSurveys[index]))),
              ),
            );
          }),
    );
  }
}

double getWidth(BuildContext context, Orientation or) {
  if (or == Orientation.portrait) {
    return MediaQuery.of(context).size.width;
  } else {
    return MediaQuery.of(context).size.width / 2;
  }
}
