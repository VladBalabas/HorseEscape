import 'package:flutter/material.dart';

class GestureIcon extends StatefulWidget {
  final bool isChoosed;
  final String path;
  const GestureIcon({super.key, required this.isChoosed, required this.path});

  @override
  State<GestureIcon> createState() => _GestureIconState();
}

class _GestureIconState extends State<GestureIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          
        });
      },
    );
  }
}