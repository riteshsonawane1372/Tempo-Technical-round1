import 'package:flutter/material.dart';
import 'package:tampo/utills/colors.dart';

class editIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Icon(Icons.edit_rounded,color:Colors.white,),
      decoration: BoxDecoration(
        color: ProjectColors().edit_icon_color,
        borderRadius: BorderRadius.circular(18),
      ),
    );
  }
}