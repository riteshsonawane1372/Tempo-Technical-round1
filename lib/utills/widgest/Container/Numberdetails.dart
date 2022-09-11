import 'package:flutter/material.dart';
import 'package:tampo/utills/widgest/Text/MediumBoldText.dart';
import 'package:tampo/utills/widgest/Text/NumberText.dart';

class NumberDetails extends StatelessWidget {

  final String ContactLocation;
  final String ContactNumber;

  NumberDetails({
    required this.ContactLocation,
    required this.ContactNumber
});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  NumText(text: '${ContactLocation}',size: 15,),
                ],
              ),
              Row(
                children: [
                  MediumText(text: '${ContactNumber}',size: 18,)
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(Icons.message_outlined,color: Colors.black54.withOpacity(0.5),),
                  SizedBox(width: 15,),
                  Icon(Icons.call_outlined,color: Colors.black54.withOpacity(0.5),)
                ],
              )

            ],
          ),

        ],
      ),
    );
  }
}
