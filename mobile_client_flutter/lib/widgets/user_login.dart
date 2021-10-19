import 'package:flutter/material.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.lightGreenAccent,
  //primary: Colors.lightGreenAccent,
  //minimumSize: Size(88, 36),
  padding: EdgeInsets.all(12),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),
  ),
);
class UserLogin extends StatelessWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Hero(
            tag: 'hero',
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 48.0,
              child: Image.asset(
                  'assets/images/Maastricht_University_logo_(2017_new_version).svg'),
            ),
          ),
          SizedBox(height: 48.0),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            initialValue: 'blacktechstudio.dev@gmail.com',
            decoration: InputDecoration(
              hintText: 'Email',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          TextFormField(
            autofocus: false,
            initialValue: 'some password',
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Padding(
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
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Forgot password?",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
