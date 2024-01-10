import 'package:flutter/material.dart';

class Apple extends StatelessWidget {
  final String path;
  Apple({super.key, required this.path });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Container(
        child: Image.asset(path),
      ),
    );
  }
}
