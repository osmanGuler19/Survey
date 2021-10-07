import 'package:flutter/material.dart';

class PreviousButton extends StatelessWidget {
  final bool isClickable;
  const PreviousButton({Key? key, required this.isClickable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){}, 
      child: Text('Previous',style: TextStyle(color: Colors.white),),
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(63, 81, 181, 1),
        onPrimary: Colors.white,
        onSurface: Colors.grey,
      ),);
  }
}
