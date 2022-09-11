import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {

  final String text;
  int size;
  Color color;

  MediumText({
    required this.text,
    this.size =30,
    this.color =Colors.black
});

  @override
  Widget build(BuildContext context) {
    return Text('${text}',
      style: TextStyle(
          fontSize: size.toDouble(),
          fontWeight:FontWeight.w500,
          color: color
      ),);
  }
}
