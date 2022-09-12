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

    final double heightD = MediaQuery.of(context).size.height;
    final double widthD = MediaQuery.of(context).size.width;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: heightD/17.38, left: widthD/20.6, right: widthD/20.6),
              child: Column(
                children: [
                  // Top Nav
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PopButton(height: heightD/17.38,width: widthD/8.24,),
                      editIcon(),
                    ],
                  ),
                  SizedBox(height: heightD/34.76,),
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
                              width: widthD/3.43,
                              height: heightD/7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(widthD/13.73),
                                  image: DecorationImage(
                                    image: NetworkImage('${ProfilePic}'),
                                    fit: BoxFit.cover
                                  ),
                                  color: Colors.red
                              ),
                            ),
                          ),
                          SizedBox(height:heightD/58 ,),
                          // Name
                          Container(
                            child:MediumText(text:'${FirstName} ${LastName}' ,size: widthD/20.6,),
                          ),
                          SizedBox(height:heightD/174,),
                          // Number
                          Container(
                            child: NumText(text: '(907)  ${MobileNumber}'),
                          )

                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: heightD/34.76,),
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
            SizedBox(height: heightD/43.45,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: heightD/24,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                )
              ],
            ),
            // Contact Details with Number
            Container(
                padding: EdgeInsets.only(top: heightD/28.96,left: widthD/20.6,right: widthD/20.6),
                child: NumberDetails(ContactLocation: 'Mobile',ContactNumber: '(907) ${MobileNumber}',)
            ),
            Container(
                padding: EdgeInsets.only(top: heightD/28.96,left: widthD/20.6,right: widthD/20.6),
                child: NumberDetails(ContactLocation: 'Home',ContactNumber: '(907) ${MobileNumber} ')
            ),
            Container(
                padding: EdgeInsets.only(top: heightD/28.96,left: widthD/20.6,right: widthD/20.6),
                child: NumberDetails(ContactLocation: 'Office',ContactNumber: '${MobileNumber}')
            ),

            // Bottom Share qr Icons
            Container(
              padding: EdgeInsets.only(top: heightD/17.38,left: widthD/20.6,right: widthD/20.6),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      ButtonIcon(icon: Icons.share_location, color: ProjectColors().locaion_icon_color),
                      SizedBox(height: heightD/87,),
                      NumText(text: 'share location')

                    ],
                  ),
                  Column(
                    children: [
                      ButtonIcon(
                        icon: Icons.qr_code_outlined,
                        color: ProjectColors().qr_code_color,
                        iconColor: Colors.black54,),
                      SizedBox(height: heightD/87,),
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
                      SizedBox(height: heightD/87,),
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

