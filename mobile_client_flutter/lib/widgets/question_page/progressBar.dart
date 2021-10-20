import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/myModelView.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<myModelView>(context);
    var val =(vm.i * 100) ~/ vm.questionList.length;
    return FAProgressBar(
      currentValue: val,
      displayText: '%',
      progressColor: val <= 40 ? Colors.red : Colors.orange,
      changeColorValue: 80,
      changeProgressColor: Colors.green,
    );
  }
}
