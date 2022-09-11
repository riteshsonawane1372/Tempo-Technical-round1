import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {

  final String text;
  int  size ;
  Color color;

  BoldText({
    required this.text,
    this.size=20,
    this.color=Colors.black
});


  @override
  Widget build(BuildContext context) {
    return Text('${text}',
      style: TextStyle(
          fontSize: size.toDouble(),
          fontWeight:FontWeight.w700),);
  }
}
