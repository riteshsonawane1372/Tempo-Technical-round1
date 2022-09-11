import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:tampo/Data/data.dart';

class UserModel extends ISuspensionBean {
  late String FirstName;
  late String LastName;
  late int IndexId;
  late String MobileNumber;
  late String NetworkImage;
  late String tag;

  UserModel({
    required this.FirstName,
    required this.LastName,
    required this.MobileNumber,
    required this.IndexId,
    required this.NetworkImage,
    required this.tag
});
  @override
  String getSuspensionTag()=> tag;
  // Maps to object

UserModel.fromJson(Map<String,dynamic> json) {

  this.IndexId = json['id'];
  this.MobileNumber = json['contactNumber'];
  this.FirstName = json['firstName'];
  this.LastName = json['lastName'];
  this.NetworkImage = json['imageUrl'];
  this.tag = json['firstName'][0];

}

// Object to Map

Map<String,dynamic> toMap() {

  return {
    'index':this.IndexId,
    'Number':this.MobileNumber,
    'FirstName': this.FirstName,
    'LastName' : this.LastName,
    'ImageUrl':this.NetworkImage,
    'tag':this.tag

  };

}

}