import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tampo/Data/data.dart';
import 'package:tampo/models/userModels.dart';
import 'package:tampo/utills/widgest/Text/MediumBoldText.dart';
import 'package:tampo/utills/widgest/Text/overflowText.dart';

class ListViewMain extends StatefulWidget {
  const ListViewMain({Key? key}) : super(key: key);

  @override
  State<ListViewMain> createState() => _ListViewMainState();
}

class _ListViewMainState extends State<ListViewMain> {

  // Random Missed Calls
  int random() {
    return Random().nextInt(100);
  }

  @override
  Widget build(BuildContext context) {

    final double heightD = MediaQuery.of(context).size.height;
    final double widthD = MediaQuery.of(context).size.width;

    return FutureBuilder(
            future: Data().getData(),
            builder:(context,data){
             if(data.hasError) return Center(child: Text('Error Occured \n try again...'),);
             else if(data.hasData){
               // Data To show Of type UserModel
               var Data = data.data as List<UserModel>;
               return Container(
                 height: heightD/3.95,
                 child: ScrollConfiguration(
                   behavior: const ScrollBehavior().copyWith(overscroll: false),
                   child: ListView.builder(
                       itemCount: 15,
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context,index){
                         return Padding(
                             padding: const EdgeInsets.all(5),
                             child: Column(
                               children: [
                                 Row(
                                   children: [
                                     Container(
                                       width: widthD/3.8,
                                       height: heightD/7.2,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(widthD/16.48),
                                           color: Colors.black,
                                           image: DecorationImage(
                                             image: NetworkImage('${Data[index].NetworkImage}',),
                                             fit: BoxFit.cover,
                                             colorFilter: ColorFilter.mode(Colors.indigo, BlendMode.color),
                                           )
                                       ),

                                     ),
                                   ],
                                 ),
                                 // Contact Name
                                 Row(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     Container(
                                         width:widthD/3.43,
                                         height: heightD/20,
                                         child: Center(
                                             child:OverFlowText(
                                               text: '${Data[index].FirstName}'" "+'${Data[index].LastName}',
                                               size:widthD/31.69,)
                                         ))
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Container(
                                         child: Center(
                                             child: MediumText(text: '${random()}'+" "'Mins ago',size: widthD/34.3,)
                                         )
                                     )
                                   ],
                                 )
                               ],
                             )
                         );
                       }),
                 ),
               );
             }
             else return Center(child: CircularProgressIndicator(),);

            });

  }
}
