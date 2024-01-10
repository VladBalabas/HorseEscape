import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {

  final child;

  MyBarrier({ this.child});

   @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Container(
        child: child,
      ),
    );
  }
}
