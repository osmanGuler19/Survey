import 'package:flutter/material.dart';
import '../viewmodel/myModelView.dart';
import 'package:provider/provider.dart';

class NextButton extends StatelessWidget {
  final bool isClickable;
  final int index;
  const NextButton({Key? key, required this.isClickable, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<myModelView>(context);
    return ElevatedButton(
      onPressed: () {
        vm.nextQuestion();
        vm.questionList[vm.i];
      },
      child: Text(
        'Next',
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
