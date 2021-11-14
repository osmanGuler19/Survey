import 'package:client_flutter/viewmodel/userViewModel.dart';
import 'package:flutter/material.dart';
import '../../viewmodel/userViewModel.dart';
import 'package:provider/provider.dart';

class SignInButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordCheckController;

  const SignInButton(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.nameController,
      required this.lastNameController,
      required this.passwordCheckController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserViewModel>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          if (passwordController.text != passwordCheckController.text) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Passwords do not match'),
            ));
            return;
          }

          if (emailController.text != '' &&
              passwordController.text != '' &&
              nameController.text != '' &&
              lastNameController.text != '' &&
              passwordCheckController.text != '') {
            vm.AddUser(emailController.text, passwordController.text,nameController.text, lastNameController.text);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Signed in successfully!'),
            ));

             Navigator.of(context).pop();

          }
        },
        child: Text(
          "Sign in",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  //onPrimary: Colors.lightBlueAccent,
  primary: Colors.white,
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.all(12),
  fixedSize: Size(144, 36),
  side: BorderSide(color: Colors.black),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),
  ),
);
