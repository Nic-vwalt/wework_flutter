import 'package:flutter/material.dart';
import 'package:weworkflutter/screens/findskill/findskill.dart';

void main() => runApp(MaterialApp(
  title: 'Named Routes Demo',
  // Start the app with the "/" named route. In this case, the app starts
  // on the FirstScreen widget.
  initialRoute: '/',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/skilllist': (context) => FindSkillScreen(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    //'/second': (context) => SecondScreen(),
  },
  theme: ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
    // counter didn't reset back to zero; the application is not restarted.
    primarySwatch: Colors.yellow,
  ),
));
