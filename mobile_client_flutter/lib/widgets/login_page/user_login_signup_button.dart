import 'package:flutter/material.dart';


class UserSignupButton extends StatelessWidget {
  const UserSignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {},
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
  fixedSize: Size(144,36),
  side: BorderSide(color: Colors.black),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),

  ),
);