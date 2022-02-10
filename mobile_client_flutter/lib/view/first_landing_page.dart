import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstLandingPage extends StatelessWidget {
  const FirstLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: Center(
          child: Text(
            "Responsibility Matrix",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: GestureDetector(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(21, 101, 192, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Responsibility Matrix",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "The responsibility Matrix a general framework to explicitly design responsibility in data science projects.",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(160, 60),
                        primary: Colors.transparent,
                        side: BorderSide(color: Colors.white),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Get Started",
                        style: TextStyle(fontSize: 25),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
