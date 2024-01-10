import 'package:flutter/material.dart';
import 'package:horse_escape/src/white/comps/comps/background_container.dart';

import 'comps/comps/pixel_font.dart';
import 'comps/comps/shop_row.dart';

// ignore: must_be_immutable
class ShopPage extends StatefulWidget {
  int score;
  final Function (List<bool>) updatePurchase;
  ShopPage({super.key, required this.score, required this.updatePurchase});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<bool> purchasings = [
    true,
    false,
    false,
    false,
    true,
    false,
    false,
    false
  ];
  @override
  void initState() {
    widget.updatePurchase(purchasings);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("S H O P", style: pixelFont),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Text(
                '${widget.score}',
                style: pixelFont.copyWith(fontSize: 20, letterSpacing: 0),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 25,
                child: Image.asset('assets/coin.png'),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Food', style: pixelFont.copyWith(fontSize: 20),),
                    SizedBox(height: 15,),
                    ShopRow(
                      purchasing: purchasings[0],
                      image: Image.asset('assets/apples/apple0.png'),
                      price: 0,
                      score: widget.score,
                      onPurchase: () {}
                    ),
                    SizedBox(height: 5,),
                    ShopRow(
                      purchasing: purchasings[1], 
                      image: Image.asset('assets/apples/apple1.png'), 
                      price: 100, 
                      score: widget.score,
                      onPurchase: () {
                        setState(() {
                          purchasings[1] = !purchasings[1];
                          widget.score -= 100;
                          widget.updatePurchase(purchasings);
                        });
                      }
                    ),
                    SizedBox(height: 5,),
                    ShopRow(
                      purchasing: purchasings[2], 
                      image: Image.asset('assets/apples/apple3.png'), 
                      price: 200, 
                      score: widget.score,
                      onPurchase: () {
                        setState(() {
                          purchasings[2] = !purchasings[2];
                          widget.score -= 200;
                          widget.updatePurchase(purchasings);
                        });
                      }
                    ),
                    SizedBox(height: 5,),
                    ShopRow(
                      purchasing: purchasings[3], 
                      image: Image.asset('assets/apples/apple2.png'), 
                      price: 500, 
                      score: widget.score,
                      onPurchase: () {
                        setState(() {
                          purchasings[3] = !purchasings[3];
                          widget.score -= 500;
                          widget.updatePurchase(purchasings);
                        });
                      }
                    )
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:30),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                SizedBox(height: 5,),
                Text('Backgrounds', style: pixelFont.copyWith(fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BackgroundContainer(
                        path:'assets/backgrounds/background0.png',
                        price: 1000, 
                        score: widget.score,
                        purchasing: purchasings[4],
                        onPurchase: () {},
                      ),
                      BackgroundContainer(
                        path:'assets/backgrounds/background1.png',
                        price: 1000, 
                        score: widget.score,
                        purchasing: purchasings[5],
                        onPurchase: () {
                          setState(() {
                          purchasings[5] = !purchasings[5];
                          widget.score -= 1000;
                          widget.updatePurchase(purchasings);
                        });
                        },
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BackgroundContainer(
                        path:'assets/backgrounds/background2.png',
                        price: 1000, 
                        score: widget.score,
                        purchasing: purchasings[6],
                        onPurchase: () {
                          setState(() {
                          purchasings[6] = !purchasings[6];
                          widget.score -= 1000;
                          widget.updatePurchase(purchasings);
                        });
                        },
                      ),
                      BackgroundContainer(
                        path:'assets/backgrounds/background3.png',
                        price: 1000, 
                        score: widget.score,
                        purchasing: purchasings[7],
                        onPurchase: () {
                          setState(() {
                          purchasings[7] = !purchasings[7];
                          widget.score -= 1000;
                          widget.updatePurchase(purchasings);
                        });
                        },
                      ),
                      
                    ],
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
