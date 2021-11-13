import 'package:flutter/material.dart';
import '../../viewmodel/questionModelView.dart';
import 'package:provider/provider.dart';

class NextButton extends StatelessWidget {
  
  const NextButton({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<QuestionModelView>(context);
    String isLast(){
    if(vm.isLastQuestion()){
      return "Submit";
    }
    else{
      return "Next";
    }
    }

    return ElevatedButton(
      onPressed: () {
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

