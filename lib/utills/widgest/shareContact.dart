import 'package:flutter_share/flutter_share.dart';
import 'package:flutter/material.dart';

class ShareContact{

  final String FirstName;
  final String message;
  final String title;

  ShareContact({
    required this.FirstName,
    required this.message,
    required this.title
});

  Future<void> share() async {
    await FlutterShare.share(
        title: '${title}',
        text: '${message} ${FirstName}',
        chooserTitle: 'Tampo');
  }

}
