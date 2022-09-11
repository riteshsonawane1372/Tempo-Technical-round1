import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';


class AZItem extends ISuspensionBean{

  final String FirstName;
  final String tag;

  AZItem({
    required this.FirstName,
    required this.tag
});

  @override
  String getSuspensionTag()=> tag;

}
