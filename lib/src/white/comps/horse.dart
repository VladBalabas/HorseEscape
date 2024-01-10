import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Horse extends StatelessWidget {
  String animationKey;
  Horse({required this.animationKey});

  @override
  Widget build(BuildContext context) {
    if (animationKey == 'right') {
      return Image.asset('assets/horse/right/right.gif');
    } else if (animationKey == 'left') {
      return Image.asset('assets/horse/left/left.gif');
    } else if (animationKey == 'up') {
      return Image.asset('assets/horse/up/up.gif');
    } else if (animationKey == 'down') {
      return Image.asset('assets/horse/down/down.gif');
    } else {
      return Image.asset('assets/horse/static.png');
    }
  }
}





