import 'package:flutter/material.dart';
import 'package:tampo/utills/colors.dart';

class editIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/8.24,
      height: MediaQuery.of(context).size.height/17.38,
      child: Icon(Icons.edit_rounded,color:Colors.white,),
      decoration: BoxDecoration(
        color: ProjectColors().edit_icon_color,
        borderRadius: BorderRadius.circular(412/22.8),
      ),
    );
  }
}