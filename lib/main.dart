import 'package:flutter/material.dart';
import 'package:horse_escape/src/white/initial_page.dart';


import 'package:shared_preferences/shared_preferences.dart';



import 'src/checker.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String state = prefs.getString("state") ?? "";

  Widget initialWidget = getInitialWidget(state);

  runApp(MaterialApp(
    home: initialWidget,
    debugShowCheckedModeBanner: false,
  ));
}

Widget getInitialWidget(String state) {
  switch (state) {
    case "black":
      return InitialPage();
    case "white":
      return InitialPage();
    default:
      return Checker();
  }
}

