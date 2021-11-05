import 'package:flutter/material.dart';


MyAppBar({String FirstText, String SecoundText, double x, double y}){
  return AppBar(
    elevation: 0,

    title: Transform.translate(
      offset: Offset(x, y),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Text("$FirstText", style: TextStyle(color: Colors.white),),
          new SizedBox(width: 5,),
          new Text("$SecoundText", style: TextStyle(color: Colors.white),),
        ],
      ),
    ),

  );
}