import 'package:flutter/material.dart';

import 'pixel_font.dart';

// ignore: must_be_immutable
class ShopRow extends StatefulWidget {
  final bool purchasing;
  final Image image;
  final int price;
  int score;
  final VoidCallback onPurchase;
  ShopRow({
    super.key,
    required this.purchasing,
    required this.image,
    required this.price,
    required this.score,
    required this.onPurchase
  });

  @override
  State<ShopRow> createState() => _ShopRowState();
}

class _ShopRowState extends State<ShopRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 40, child: widget.image),
        SizedBox(
          width: 10,
        ),
        Text(
          '- ${widget.price}',
          style: pixelFont,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 25,
          child: Image.asset('assets/coin.png'),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (!widget.purchasing&&widget.price<=widget.score){
                widget.score=widget.score-widget.price;
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
        )
      ],
    );
  }
}
