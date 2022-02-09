import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstLandingPage extends StatelessWidget {
  const FirstLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: GestureDetector(
            onTap: () => launch('https://github.com/osmanGuler19/Survey'),
            child: RichText(
              text: TextSpan(
                  text: "If you like Matrix, give it a star on ",
                  children: [
                    TextSpan(
                        text: "Github!",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
