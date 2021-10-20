import 'package:flutter/material.dart';
 import 'package:flutter_svg/flutter_svg.dart';

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
class UserLogin extends StatelessWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width/2,
          child: Column(
            children: [
              Hero(
                tag: 'hero',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 144.0,
                  child: SvgPicture.network(
                      'https://upload.wikimedia.org/wikipedia/commons/6/6a/Maastricht_University_logo.svg'),
                ),
              ),
              SizedBox(height: 48.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                initialValue: 'maastricht_university@gmail.com',
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
        ),
      ),
    );
  }
}
