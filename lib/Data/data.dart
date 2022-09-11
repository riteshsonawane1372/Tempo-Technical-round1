import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tampo/models/userModels.dart';


class Data {
  Future  getData() async{
    final res = await rootBundle.loadString('assets/employees.json');
    var data =json.decode(res) as List <dynamic>;
    return data.map((e) => UserModel.fromJson(e)).toList();

   }



}

