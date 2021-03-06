import 'package:client_flutter/viewmodel/surveyViewModel.dart';
import 'package:flutter/material.dart';
import '../viewmodel/userViewModel.dart';
import 'package:provider/provider.dart';
import 'user_survey_detail.dart';
import '../model/myModel.dart';

class UserSurveyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vms = Provider.of<SurveyViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('User\'s Survey List')),
      ),
      body: Center(
        child: Container(
          width: getWidth(context, MediaQuery.of(context).orientation),
          child: ListView.builder(
              itemCount: vms.userSurveys.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(vms.userSurveys[index].title),
                  subtitle: Text(vms.userSurveys[index].created_at.toString()),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () async {
                    List<Question> qList = await vms.GetSurveyQuestions(
                        vms.userSurveys[index].survey_id);

                    List<Answer> aList = await vms.GetSurveyAnswers(
                      vms.userSurveys[index].survey_id,
                    );

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserSurveyDetailPage(
                                  survey: vms.userSurveys[index],
                                  answerList: aList,
                                  questionList: qList,
                                )));
                  },
                );
              }),
        ),
      ),
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
