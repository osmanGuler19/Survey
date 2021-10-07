import 'package:flutter/material.dart';
import '../viewmodel/myModelView.dart';

class QuestionContainer extends StatelessWidget {
  final String qText;
  const QuestionContainer({Key? key, required this.qText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List qList = new myModelView().questionList;
    return Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Align(
            alignment: Alignment.topLeft,
            child: Text(
                qText,
                style: TextStyle(color: Colors.black, fontSize: 40))));
  }
}
