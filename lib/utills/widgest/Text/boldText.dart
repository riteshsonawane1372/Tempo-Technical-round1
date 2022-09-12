import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {

  final String text;
  double  size ;
  Color color;

  BoldText({
    required this.text,
    this.size=412/20.6,
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
