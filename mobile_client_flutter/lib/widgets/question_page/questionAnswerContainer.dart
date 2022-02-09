import 'package:client_flutter/model/myModel.dart';
import 'package:flutter/material.dart';
import '../../model/myModel.dart';
import 'questionContainer.dart';
import 'answerContainer.dart';

class QuestionAnswerContainer extends StatelessWidget {
  final Question question;
  final TextEditingController controller;
  const QuestionAnswerContainer(
      {Key? key, required this.question, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
      height: 400,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          QuestionContainer(qText: question.text),
          AnswerContainer(controller: controller)
        ],
      ),
    );
  }
}
