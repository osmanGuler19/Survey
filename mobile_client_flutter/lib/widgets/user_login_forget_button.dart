import 'package:flutter/material.dart';

class UserLoginForgetButton extends StatelessWidget {
  const UserLoginForgetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              );
  }
}