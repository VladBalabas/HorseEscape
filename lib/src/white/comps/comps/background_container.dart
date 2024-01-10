import 'package:flutter/material.dart';

import 'pixel_font.dart';



// ignore: must_be_immutable
class BackgroundContainer extends StatefulWidget {
  final String path;
  final int price;
  int score;
  final bool purchasing;
  final VoidCallback onPurchase;
  BackgroundContainer(
      {super.key,
      required this.path,
      required this.purchasing,
      required this.price,
      required this.score,
      required this.onPurchase});

  @override
  State<BackgroundContainer> createState() => _BackgroundContainerState();
}

class _BackgroundContainerState extends State<BackgroundContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Image.asset(
            widget.path,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              '${widget.price}',
              style: pixelFont,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 25,
              child: Image.asset('assets/coin.png'),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (!widget.purchasing && widget.price <= widget.score) {
                    widget.score = widget.score - widget.price;
                    widget.onPurchase();
                  }
                });
              },
              child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: widget.purchasing ? Colors.green : Colors.black),
                  alignment: Alignment.center,
                  child: Icon(
                    widget.purchasing ? Icons.check : Icons.add,
                    size: 18,
                    color: Colors.white,
                  )),
            ),
          ],
        )
      ],
    );
  }
}
