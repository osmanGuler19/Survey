import 'package:flutter/material.dart';
import '../widgets/user_login_logo.dart';
import '../widgets/user_login_email.dart';
import '../widgets/user_login_password.dart';
import '../widgets/user_login_login_button.dart';
import '../widgets/user_login_forget_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width/2,
          child: Column(
            children: [
              UserLoginLogo(),
              SizedBox(height: 48.0),
              UserLoginEmail(),
              SizedBox(height: 8.0),
              UserLoginPassword(),
              SizedBox(height: 24.0),
              UserLoginButton(),
              UserLoginForgetButton()
            ],
          ),
        ),
      ),
    );
  }
}