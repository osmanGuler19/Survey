import 'package:client_flutter/view/question.dart';
import 'package:client_flutter/view/users_surveys_list.dart';
import 'package:client_flutter/viewmodel/surveyViewModel.dart';
import 'package:flutter/material.dart';
import '../viewmodel/userViewModel.dart';
import 'package:provider/provider.dart';
import '../../model/myModel.dart';
import '../../constants/strings.dart';

class UserLandingPage extends StatelessWidget {
  const UserLandingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserViewModel>(context);
    final vms = Provider.of<SurveyViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Landing Page"),
      ),
      body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text(
              'Welcome ${vm.user.name}!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        vms.survey = new Survey(
                            survey_id: vm.user.email +
                                "--" +
                                DateTime.now().toString(),
                            title: survey_title,
                            description: survey_description,
                            created_at: DateTime.now(),
                            user: vm.user);
                        print(vms.survey.survey_id);
                        await vms.AddSurveyWithoutAnswers(
                            vm.user.email + "--" + DateTime.now().toString(),
                            survey_title,
                            survey_description,
                            DateTime.now(),
                            vm.user);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuestionPage()));
                      },
                      child: Text("Take a Survey")),
                  SizedBox(width: 40),
                  ElevatedButton(
                      onPressed: () async {
                        await vms.getUserSurveys(vm.user.email);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserSurveyListPage()));
                      },
                      child: Text("Check the previous surveys")),
                ],
              ),
            ),
          ])),
    );
  }
}
