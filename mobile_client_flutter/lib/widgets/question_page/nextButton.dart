import 'package:client_flutter/model/myModel.dart';
import 'package:flutter/material.dart';
import '../../viewmodel/questionViewModel.dart';
import '../../viewmodel/answerViewModel.dart';
import '../../viewmodel/surveyViewModel.dart';
import 'package:provider/provider.dart';

class NextButton extends StatelessWidget {
  final TextEditingController controller;
  const NextButton({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<QuestionViewModel>(context);
    final vma = Provider.of<AnswerViewModel>(context);
    final vms = Provider.of<SurveyViewModel>(context);
    String isLast() {
      if (vm.isLastQuestion()) {
        return "Submit";
      } else {
        return "Next";
      }
    }

    return ElevatedButton(
      onPressed: () async {
        Answer ans = new Answer(
              order: vma.answerOrder,
              response: controller.text,
              survey: vms.survey);
        vma.addAnswerToList(ans);

        if (vm.isLastQuestion()) {
          for(int i =0;i<vma.answers.length;i++){
            await vma.AddAnswer(vma.answerOrder, vma.answers[i].response,vms.survey);
          }
        } else {
          vm.nextQuestion();
          controller.clear();
        }
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
