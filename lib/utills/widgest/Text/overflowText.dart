import 'package:flutter/material.dart';

class OverFlowText extends StatelessWidget {

  final  String text;
  int size;

  OverFlowText({
    required this.text,
    this.size=20
});

  @override
  Widget build(BuildContext context) {
    return Text("${text}",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: size.toDouble()
      ),
    );
  }
}
