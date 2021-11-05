import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/Ui_Widget/MyAppBar.dart';

class SettingsPage extends StatefulWidget {
  // const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        FirstText: "News",
        SecoundText: "Settings",
        x: 0,
        y: 0
      ),
      body: Align(
        alignment: Alignment.center,
        child: new Column(
            children: [
              new SizedBox(height: 50),

              Padding(padding: EdgeInsets.all(10),child: new Text("Settings", style: TextStyle(fontSize: 50),)),

          new SizedBox(height: 100),

        new Row(
          children: [
            Padding(padding: EdgeInsets.all(10),child: new Text("Unable Dark Theme",style: TextStyle(fontSize: 20),)),
            // TODO: Dark & Light Theme Box
            new Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool value) {
                setState(() {
                  isChecked = value;
                  value == false ? AdaptiveTheme.of(context).setLight():
                  AdaptiveTheme.of(context).setDark();



                });
              },
            ),
          ],
        )

        ]),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.black;
  }
}
