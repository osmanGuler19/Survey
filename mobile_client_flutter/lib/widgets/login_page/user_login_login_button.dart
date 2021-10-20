import 'package:flutter/material.dart';

class UserLoginButton extends StatelessWidget {
  const UserLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {},
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
  onPrimary: Colors.lightGreenAccent,
  //primary: Colors.lightGreenAccent,
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.all(12),
  fixedSize: Size(144,36),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),
  ),
);