
import 'package:flutter/material.dart';

class PopButton extends StatelessWidget {

  double height;
  double width;

  PopButton({
    this.width=412/13.7,
    this.height=869/28.9
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: InkWell(
        onTap: (){
          Navigator.pop(context,false);
        },
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black54.withOpacity(0.3),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
