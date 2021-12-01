import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/userViewModel.dart';
import '../../viewmodel/surveyViewModel.dart';
import '../../model/myModel.dart';
import '../../view/question.dart';
import '../../view/user_landing.dart';
import '../../constants/strings.dart';

class UserLoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const UserLoginButton(
      {Key? key,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserViewModel>(context);
    final vms = Provider.of<SurveyViewModel>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () async {
          User? user =
              await vm.getUser(emailController.text, passwordController.text);

          if (user != null) {

            // Don't delete this line.
            /*
            vm.user = user;
            vms.survey = new Survey(
                survey_id: vm.user.email + "--" + DateTime.now().toString(),
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
                */
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserLandingPage()));
          }
        },
        child: Text(
          "Log In",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  //onPrimary: Colors.lightGreenAccent,
  primary: Color.fromRGBO(0, 21, 58, 1),
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.all(12),
  fixedSize: Size(144, 36),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),
  ),
);
