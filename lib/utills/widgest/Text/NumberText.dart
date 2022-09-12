import 'package:flutter/material.dart';


class NumText extends StatelessWidget {
  final String text;
  double size;
  NumText({
    required this.text,
    this.size=412/34.3
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
