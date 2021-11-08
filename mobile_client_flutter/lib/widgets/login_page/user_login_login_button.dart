import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/userModelView.dart';
import '../../model/myModel.dart';
import '../../view/question.dart';

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
    final vm = Provider.of<userModelView>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () async {
          User? user =
              await vm.getUser(emailController.text, passwordController.text);

          if (user != null) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionPage()));
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
