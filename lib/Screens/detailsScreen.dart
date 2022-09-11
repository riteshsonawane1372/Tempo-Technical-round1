import 'package:flutter/material.dart';
import 'package:tampo/utills/colors.dart';
import 'package:tampo/utills/widgest/Container/Numberdetails.dart';
import 'package:tampo/utills/widgest/Icons/BackButton.dart';
import 'package:tampo/utills/widgest/Icons/ButtonIcon.dart';
import 'package:tampo/utills/widgest/Icons/edit_icon.dart';
import 'package:tampo/utills/widgest/Text/MediumBoldText.dart';
import 'package:tampo/utills/widgest/Text/NumberText.dart';
import 'package:tampo/utills/widgest/shareContact.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailScreen extends StatelessWidget {

  final String ProfilePic;
  final String FirstName;
  final String LastName;
  final MobileNumber;

  const DetailScreen({
    required this.ProfilePic,
    required this.FirstName,
    required this.LastName,
    required this.MobileNumber});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                children: [
                  // Top Nav
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PopButton(height: 50,width: 50,),
                      editIcon(),
                    ],
                  ),
                  SizedBox(height: 25,),
                  // Profile Name and Num
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          // Profile Pic
                          Hero(
                            tag:'Profile-Pic',
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: NetworkImage('${ProfilePic}'),
                                    fit: BoxFit.cover
                                  ),
                                  color: Colors.red
                              ),
                            ),
                          ),
                          SizedBox(height:15 ,),
                          // Name
                          Container(
                            child:MediumText(text:'${FirstName} ${LastName}' ,size: 20,),
                          ),
                          SizedBox(height:5,),
                          // Number
                          Container(
                            child: NumText(text: '(907)  ${MobileNumber}'),
                          )

                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 25,),
                  // ButtonIcon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonIcon(icon: Icons.whatsapp_outlined,
                          color: ProjectColors().messger_color),
                      InkWell(
                        onTap: ()=> launch('tel://(907) ${MobileNumber}'),
                        child: ButtonIcon(
                            icon: Icons.call,
                            color: ProjectColors().call_icon_color),
                      ),
                      ButtonIcon(
                        icon: Icons.videocam_outlined,
                        color: ProjectColors().video_icon_color,),
                      InkWell(
                        onTap: ()=> launch('sms: ${MobileNumber}'),
                        child: ButtonIcon(
                          icon: Icons.email_outlined,
                          color: ProjectColors().sms_icon_color,
                          iconColor: Colors.black54,),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 35,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                )
              ],
            ),
            // Contact Details with Number
            Container(
                padding: EdgeInsets.only(top: 30,left: 20,right: 20),
                child: NumberDetails(ContactLocation: 'Mobile',ContactNumber: '(907) ${MobileNumber}',)
            ),
            Container(
                padding: EdgeInsets.only(top: 30,left: 20,right: 20),
                child: NumberDetails(ContactLocation: 'Home',ContactNumber: '(907) ${MobileNumber} ')
            ),
            Container(
                padding: EdgeInsets.only(top: 30,left: 20,right: 20),
                child: NumberDetails(ContactLocation: 'Office',ContactNumber: '${MobileNumber}')
            ),

            // Bottom Share qr Icons
            Container(
              padding: EdgeInsets.only(top: 50,left: 20,right: 20),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      ButtonIcon(icon: Icons.share_location, color: ProjectColors().locaion_icon_color),
                      SizedBox(height: 10,),
                      NumText(text: 'share location')

                    ],
                  ),
                  Column(
                    children: [
                      ButtonIcon(
                        icon: Icons.qr_code_outlined,
                        color: ProjectColors().qr_code_color,
                        iconColor: Colors.black54,),
                      SizedBox(height: 10,),
                      NumText(text: 'Qr code')
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: ()=>ShareContact(
                            FirstName: FirstName,
                            message: 'Hi How are you ',
                            title: 'Tampo').share(),

                          child: ButtonIcon(icon: Icons.share_outlined,
                              color: ProjectColors().messger_color)),
                      SizedBox(height: 10,),
                      NumText(text: 'Share contact')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

