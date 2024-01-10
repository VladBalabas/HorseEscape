import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


import 'package:shared_preferences/shared_preferences.dart';

import 'white/initial_page.dart';


//import 'black/black.dart';



class Checker extends StatelessWidget {
  const Checker({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<void>(
          future: _checkPage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return _buildPage(InitialPage());
            } else {
              return _buildPage(InitialPage());
            }
          },
        ),
      ),
    );
  }

  Future<void> _checkPage() async {
    const url = '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await http.get(Uri.parse(url));
      prefs.setString("state", response.statusCode == 200 ? "black" : "white");
    } catch (e) {
      print(e);
      prefs.setString("state", "white");
    }
  }

  Widget _buildPage(Widget page) {
    return page;
  }
}
