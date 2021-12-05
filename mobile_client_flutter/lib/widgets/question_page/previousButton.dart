import 'package:client_flutter/viewmodel/answerViewModel.dart';
import 'package:flutter/material.dart';
import '../../viewmodel/questionViewModel.dart';
import 'package:provider/provider.dart';

class PreviousButton extends StatelessWidget {
  final TextEditingController controller;
  const PreviousButton({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<QuestionViewModel>(context);
    final vma = Provider.of<AnswerViewModel>(context);
    return ElevatedButton(
      onPressed: () {
        vm.preQuestion();
        vma.answerOrder = vma.answerOrder - 1;
        vma.decreaseInd();
        controller.text = vma.answers[vma.ind].response;
      },
      child: Text(
        'Previous',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(63, 81, 181, 1),
        onPrimary: Colors.white,
        onSurface: Colors.grey,
      ),
    );
  }
}
