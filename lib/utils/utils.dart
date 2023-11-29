import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

appContentText(
    {required String contextText,
    required Color color,
    required FontWeight fontWeight,
    required double fontSize,
    required double height,
    TextAlign? textAlign,
    int? maxLines,

    }) {
  return Text(
    contextText,
    maxLines: maxLines,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      height: height,
    ),
  );
}
appContentText1(
    {required String contextText,
    required Color color,
    required FontWeight fontWeight,
    required double fontSize,
    required double height,
      required bool visibility,
    TextAlign? textAlign,
    int? maxLines,

    }) {
  return Visibility(
    visible: visibility,
    child: Text(
      contextText,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        height: height,
      ),
    ),
  );
}

appFilterResults(
    {required String contextText,
      required Color color,
      required FontWeight fontWeight,
      required double fontSize,
      required double height,

      TextAlign? textAlign,
      int? maxLines,

    }) {
  return Card(
    elevation: 1,
    shadowColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        contextText,
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: height,
        ),
      ),
    ),
  );
}

GlobalKey<ScaffoldState> _key = GlobalKey(); // add this

AppBar customAppBar({String? text}) {
  return AppBar(
    title: appContentText(
      contextText: text!,
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 18,
      height: 0,
    ),
  );


}
