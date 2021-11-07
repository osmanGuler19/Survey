import 'package:flutter/material.dart';
import '../widgets/signup_page/genericTextField.dart';
import '../widgets/signup_page/signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController FirstNameController = new TextEditingController();
    TextEditingController LastNameController = new TextEditingController();
    TextEditingController EmailController = new TextEditingController();
    TextEditingController PasswordController = new TextEditingController();
    TextEditingController PasswordConfirmController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign in"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
          color: Colors.white,
          child: Column(
            
            children: [
              SvgPicture.asset('assets/images/university_logo.svg',placeholderBuilder: (BuildContext context) => Container(
                      child: const CircularProgressIndicator()),),
              GenericTextField(
                hText: "First Name",
                controller: FirstNameController,
              ),
              SizedBox(height: 10),
              GenericTextField(
                hText: "Last Name",
                controller: LastNameController,
              ),
              SizedBox(height: 10),
              GenericTextField(
                hText: "Email",
                controller: EmailController,
              ),
              SizedBox(height: 10),
              GenericTextField(
                hText: "Password",
                controller: PasswordController,
              ),
              SizedBox(height: 10),
              GenericTextField(
                hText: "Confirm Password",
                controller: PasswordConfirmController,
              ),
              SizedBox(height: 20),
              SignInButton(emailController: EmailController, passwordController: PasswordController, 
              nameController: FirstNameController, lastNameController: LastNameController,passwordCheckController: PasswordConfirmController),
            ],
          ),
        ),
      ),
    );
  }
}
