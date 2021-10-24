import 'package:flutter/material.dart';

class GenericTextField extends StatelessWidget {
  final String hText;
  final TextEditingController controller;
  const GenericTextField(
      {Key? key, required this.hText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 2),borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue,width: 2),borderRadius: BorderRadius.circular(10)
          ),
          
        ),
        controller: controller,
      ),
    );
  }
}
