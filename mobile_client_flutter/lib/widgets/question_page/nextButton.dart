import 'package:client_flutter/model/myModel.dart';
import 'package:client_flutter/viewmodel/userViewModel.dart';
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
    final vm = Provider.of<UserViewModel>(context);
    final vma = Provider.of<AnswerViewModel>(context);
    final vms = Provider.of<SurveyViewModel>(context);
    final vmq = Provider.of<QuestionViewModel>(context);
    String isLast() {
      if (vmq.isLastQuestion()) {
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

        if (vmq.isLastQuestion()) {
          for (int i = 0; i < vma.answers.length; i++) {
            await vma.AddAnswer(vma.answerOrder, vma.answers[i].response,
                vms.survey, vmq.questionList[i]);
          }
          await vms.UpdateSurveyTime(vms.survey.survey_id, DateTime.now());
          Navigator.pop(context);
        } else {
          vmq.nextQuestion();
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
