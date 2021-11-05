import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app_api/HelperFunction/news.dart';
import 'package:news_app_api/Screens/Arabic%20News.dart';
import 'package:news_app_api/Screens/settings.dart';

MyDrawer([BuildContext context]) {
  return Drawer(
    child: new ListView(
      children: [
        //TODO: Drawer Header
        new SizedBox(
          width: double.infinity,
          height: 200,
          child: DrawerHeader(
            decoration: BoxDecoration(color: Colors.greenAccent),
            child: Row(
              children: [
                new Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: new Text(
                    "Hello Brother",
                    style: TextStyle(fontSize: 23),
                  ),
                ),
              ],
            ),
          ),
        ),

        //TODO: Settings Option
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ),
            );
          },
        ),

        //TODO: Change to Arabic News Option
        new ListTile(
          leading: Icon(Icons.change_circle),
          title: Text("Change to Arabic News"),
          subtitle: Text(
              "That option allowed you to change the news content from the US to Arabic"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Arabic_News(),
              ),
            );
          },
        )
      ],
    ),
  );
}
