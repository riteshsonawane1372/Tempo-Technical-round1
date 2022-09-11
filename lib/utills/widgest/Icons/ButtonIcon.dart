import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {

  final IconData icon;
  final Color color;
  Color iconColor;


  ButtonIcon({
    required this.icon,
    required this.color,
    this.iconColor=Colors.white,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon,color: iconColor,),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}
