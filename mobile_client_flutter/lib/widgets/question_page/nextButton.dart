import 'package:flutter/material.dart';
import '../../viewmodel/questionViewModel.dart';
import '../../viewmodel/answerViewModel.dart';
import 'package:provider/provider.dart';

class NextButton extends StatelessWidget {
  final TextEditingController controller;
  const NextButton({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<QuestionViewModel>(context);
    final vma = Provider.of<AnswerViewModel>(context);
    String isLast() {
      if (vm.isLastQuestion()) {
        return "Submit";
      } else {
        return "Next";
      }
    }

    return ElevatedButton(
      onPressed: () async {
        if (vm.isLastQuestion()) {
          
        }
        vm.nextQuestion();
      },
      child: Text(
        isLast(),
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
