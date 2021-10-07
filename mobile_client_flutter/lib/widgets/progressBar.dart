import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class ProgressBar extends StatelessWidget {

  final int val;
  const ProgressBar({Key? key, required this.val}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FAProgressBar(
                currentValue: val,
                displayText: '%',
                progressColor: val<=40?Colors.red:Colors.orange,
                changeColorValue: 80,
                changeProgressColor: Colors.green,
              );
  }
}
