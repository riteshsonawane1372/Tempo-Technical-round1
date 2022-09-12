import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tampo/Data/data.dart';
import 'package:tampo/models/userModels.dart';
import 'package:tampo/utills/colors.dart';
import 'package:tampo/utills/widgest/Container/searchBar.dart';
import 'package:tampo/utills/widgest/List/Contact_list.dart';
import 'package:tampo/utills/widgest/Icons/edit_icon.dart';
import 'package:tampo/utills/widgest/List/listViewMainScreen.dart';
import 'package:tampo/utills/widgest/Text/MediumBoldText.dart';
import 'package:tampo/utills/widgest/Text/NumberText.dart';
import 'package:tampo/utills/widgest/Text/boldText.dart';



class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  TextEditingController _controller = TextEditingController();


// Data leaks
@override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final double heightD = MediaQuery.of(context).size.height;
    final double widthD = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            // Upper Part
            Container(
              padding: EdgeInsets.only(top: heightD/17.38, left: widthD/41.2, right: widthD/41.2),
              child: Column(
                children: [
                  // Top Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Profile_Pic
                      Container(
                        width: widthD/8.24,
                        height: heightD/17.38,
                        decoration: BoxDecoration(
                          color: ProjectColors().profile_icon_color,
                          borderRadius: BorderRadius.circular(widthD/22.88),
                        ),
                        child: Icon(Icons.person),
                      ),
                      // Contacts Text
                      Container(
                        child: BoldText(text: 'Contacts',size: widthD/18,),
                      ),
                      // Edit Icons
                      editIcon(),
                    ],
                  ),
                  SizedBox(height: heightD/34.76,),
                  // Search Bar
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: heightD/21.72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(widthD/41.2),
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          child: SearchBar(controller: _controller)

                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: heightD/86.9,),
                  // List View Builder
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            child: ListViewMain()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Second Down Part
            // Contact list
           Expanded(
               child: Container(
                   child: ContactList(
                     controller: _controller,
                   )
               ))

          ],
        ),
      )
    );
  }
}




