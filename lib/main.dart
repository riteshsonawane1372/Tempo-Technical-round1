import 'package:flutter/material.dart';
import 'package:tampo/Screens/detailsScreen.dart';
import 'package:tampo/Screens/mainScreen.dart';
import 'package:tampo/utills/widgest/List/listViewMainScreen.dart';

Future main() async{

  await initialization(null);
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MainScreen()),

  );
}

Future initialization(BuildContext? context) async{

  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(seconds: 3));

}

