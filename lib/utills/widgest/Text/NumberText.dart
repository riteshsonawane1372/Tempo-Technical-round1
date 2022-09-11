import 'package:flutter/material.dart';


class NumText extends StatelessWidget {
  final String text;
  int size;
  NumText({
    required this.text,
    this.size=12
});

  @override
  Widget build(BuildContext context) {
    return Text('${text}',style: TextStyle(
      fontSize: size.toDouble(),
      fontWeight: FontWeight.w700,
      color: Colors.grey
    ),);
  }
}
