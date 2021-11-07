import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/questionModelView.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<questionModelView>(context);
    var val;
    if (vm.questionList.length > 0) {
      val = (vm.i * 100) ~/ vm.questionList.length;
    } else {
      val = 0;
    }

    return FAProgressBar(
      currentValue: val,
      displayText: '%',
      progressColor: val <= 40 ? Colors.red : Colors.orange,
      changeColorValue: 80,
      changeProgressColor: Colors.green,
    );
  }
}
