import 'package:flutter/material.dart';
import '../../viewmodel/questionModelView.dart';
import 'package:marquee/marquee.dart';


class QuestionContainer extends StatelessWidget {
  final String qText;
  const QuestionContainer({Key? key, required this.qText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List qList = new questionModelView().questionList;
    return Container(
      height: 200,
      child: Expanded(
        //
        //padding: EdgeInsets.only(top: 20, bottom: 20),
        
        child: Align(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                  qText,
                  style: TextStyle(color: Colors.black, fontSize: 40)),
            ))),
    );
  }
}
