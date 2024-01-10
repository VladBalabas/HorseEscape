import 'package:flutter/material.dart';
import 'package:horse_escape/src/white/comps/sound_manager.dart';

class MyIconButton extends StatefulWidget {
  final Function()? onPressed;
  final IconData icon1;
  final IconData icon2;
  final SoundManager soundManager;
  MyIconButton(
      {super.key,
      required this.onPressed,
      required this.icon1,
      required this.icon2,
      required this.soundManager});

  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: IconButton(
          onPressed: widget.onPressed,
          icon: widget.soundManager.isSoundOn
              ? Icon(
                  widget.icon1,
                  color: Colors.grey[100],
                  size: 60,
                )
              : Icon(
                  widget.icon2,
                  color: Colors.grey[100],
                  size: 60,
                )),
    );
  }
}
