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

    return FutureBuilder(
            future: Data().getData(),
            builder:(context,data){
             if(data.hasError) return Center(child: Text('Error Occured \n try again...'),);
             else if(data.hasData){
               // Data To show Of type UserModel
               var Data = data.data as List<UserModel>;
               return Container(
                 height: 220,
                 child: ScrollConfiguration(
                   behavior: const ScrollBehavior().copyWith(overscroll: false),
                   child: ListView.builder(
                       itemCount: 15,
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context,index){
                         return Padding(
                             padding: const EdgeInsets.all(8),
                             child: Column(
                               children: [
                                 Row(
                                   children: [
                                     Container(
                                       width: 120,
                                       height: 120,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(25),
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
                                         width:120,
                                         height: 40,
                                         child: Center(
                                             child:OverFlowText(
                                               text: '${Data[index].FirstName}'" "+'${Data[index].LastName}',
                                               size:13,)
                                         ))
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Container(
                                         child: Center(
                                             child: MediumText(text: '${random()}'+" "'Mins ago',size: 12,)
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
