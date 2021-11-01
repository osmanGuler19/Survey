import 'package:flutter/material.dart';
import '../widgets/login_page/user_login_logo.dart';
import '../widgets/login_page/user_login_email.dart';
import '../widgets/login_page/user_login_password.dart';
import '../widgets/login_page/user_login_login_button.dart';
import '../widgets/login_page/user_login_forget_button.dart';
import '../widgets/login_page/user_login_signup_button.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Log in"),
      ),
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
              Container(
                width: MediaQuery.of(context).size.width/4,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserLoginButton(),
                        UserLoginForgetButton()
                      ],
                    ),
                    Divider(color: Colors.grey )
                  ],
                ),
              ),
              UserSignupButton()
              
            ],
          ),
        ),
      ),
    );
  }
}