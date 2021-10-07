import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnswerContainer extends StatelessWidget {
  final TextEditingController controller;
  const AnswerContainer({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      keyboardType: TextInputType.multiline,
      maxLines: 6,
      controller: controller,
      style: TextStyle(fontSize: 18.0),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),borderSide: BorderSide(color: Colors.grey.shade600,style: BorderStyle.solid,))
      ),
    );
  }
}
