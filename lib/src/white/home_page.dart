import 'dart:async';

import 'package:flutter/material.dart';
import 'package:horse_escape/src/white/comps/horse.dart';
import 'package:horse_escape/src/white/initial_page.dart';

import 'comps/barriers.dart';
import 'comps/apple.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {

  final List<bool> choosedSettings;
  HomePage({required this.choosedSettings});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  static int numberOfSquares = numberInRow * 17;
  static int numberInRow = 11;
  int player = 93;
  bool mouthClosed = true;
  int gameScore=0;
  int score = 10000;
  
  String fruitPath='';
  String backgroundPath='';

  Horse horse = Horse(animationKey: '');

  List<bool> purchasings = [];
  static List<int> soloBarriers = [57, 63, 125, 127, 156, 158, 160, 162];
  static List<int> leftCornerBarriers = [0, 99, 105, 147];
  static List<int> rightCornerBarriers = [10, 103, 109, 149];
  static List<int> rightBarriers = [37, 77, 83, 176];
  static List<int> leftBarriers = [39, 81, 87, 186];
  static List<int> upBarriers = [
    11,
    21,
    22,
    24,
    26,
    28,
    30,
    32,
    33,
    35,
    41,
    43,
    44,
    46,
    52,
    54,
    55,
    59,
    61,
    65,
    66,
    70,
    72,
    76,
    110,
    114,
    116,
    120,
    121,
    123,
    129,
    131,
    132,
    134,
    140,
    142,
    143,
    145,
    151,
    153,
    154,
    164,
    165,
    175
  ];
  static List<int> middleBarriers = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    175,
    164,
    142,
    131,
    120,
    76,
    65,
    54,
    43,
    32,
    21,
    78,
    79,
    80,
    100,
    101,
    102,
    84,
    85,
    86,
    106,
    107,
    108,
    46,
    57,
    30,
    52,
    63,
    70,
    59,
    61,
    72,
    26,
    28,
    38,
    123,
    134,
    145,
    156,
    129,
    140,
    151,
    162,
    103,
    114,
    125,
    105,
    116,
    127,
    147,
    148,
    149,
    158,
    160
  ];
  


  String setFruitPath(){
    if (widget.choosedSettings[0]){
      fruitPath='assets/apples/apple0.png';
    } else if (widget.choosedSettings[1]) {
       fruitPath='assets/apples/apple1.png';
    } else if (widget.choosedSettings[2]) {
       fruitPath='assets/apples/apple2.png';
    } else if (widget.choosedSettings[3]) {
       fruitPath='assets/apples/apple3.png';
    }
    return '';
  }

  String setBackgroundPath(){
    if (widget.choosedSettings[4]){
      backgroundPath='assets/backgrounds/background0.png';
    } else if (widget.choosedSettings[5]) {
       backgroundPath='assets/backgrounds/background1.png';
    } else if (widget.choosedSettings[6]) {
       backgroundPath='assets/backgrounds/background2.png';
    } else if (widget.choosedSettings[7]) {
       backgroundPath='assets/backgrounds/background3.png';
    }
    return '';
  }

  void updatePurchase(List <bool> updatedPurchase) {
      purchasings=updatedPurchase;
  }
  List<int> food = [];

  void getFood() {
    for (int i = 0; i < numberOfSquares; i++) {
      if (!middleBarriers.contains(i)) {
        food.add(i);
      }
    }
  }

  String direction = '';
  bool gameStarted = false;

  void startGame() {
    gameStarted = true;
    getFood();
    setState(() {
      direction='right';
    });
    Duration duration = Duration(milliseconds: 120);
    Timer.periodic(duration, (timer) {
      if (food.contains(player)) {
        gameScore++;
        food.remove(player);
      }
      
      switch (direction) {
        case "right":
          moveRight();
          break;

        case "up":
          moveUp();

          break;

        case "left":
          moveLeft();

          break;

        case "down":
          moveDown();

          break;
      }
      if (!gameStarted) {
        timer.cancel();
      }
    });
  }

  void endGame() {
    setState(() {
      gameStarted = false;
      direction = '';
      player = 93;
      score+=gameScore;
      gameScore=0;
    });
  }


  void moveRight() {
    setState(() {
      if (!upBarriers.contains(player + 1) &&
          !soloBarriers.contains(player + 1) &&
          !leftCornerBarriers.contains(player + 1) &&
          !rightCornerBarriers.contains(player + 1) &&
          !rightBarriers.contains(player + 1) &&
          !leftBarriers.contains(player + 1)) {
        player += 1;
      }
    });
  }

  void moveUp() {
    setState(() {
      if (!middleBarriers.contains(player - numberInRow) &&
          !leftBarriers.contains(player - numberInRow) &&
          !rightBarriers.contains(player - numberInRow)) {
        player -= numberInRow;
      }
    });
  }

  void moveLeft() {
    setState(() {
      if (!upBarriers.contains(player - 1) &&
          !soloBarriers.contains(player - 1) &&
          !leftCornerBarriers.contains(player - 1) &&
          !rightCornerBarriers.contains(player - 1) &&
          !rightBarriers.contains(player - 1) &&
          !leftBarriers.contains(player - 1)) {
        player -= 1;
      }
    });
  }

  void moveDown() {
    setState(() {
      if (!middleBarriers.contains(player + numberInRow)
      &&!upBarriers.contains(player + numberInRow)
      &&!leftCornerBarriers.contains(player + numberInRow)
      &&!rightCornerBarriers.contains(player + numberInRow)) {
        player += numberInRow;
      }
    });
  }

  @override
  void initState() {
    setFruitPath();
    setBackgroundPath();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SafeArea(
          child: Container(
            width: 400,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => 
                              InitialPage()
                              )
                            )
                          );
                          }, 
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          )
                        ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 35,
                      width: 170,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8)),
                      child: GestureDetector(
                        onTap: gameStarted ? endGame : startGame,
                        child: Center(
                          child: gameStarted
                              ? Text(
                                  "END GAME",
                                  style: TextStyle(fontSize: 17, color: Colors.red, letterSpacing: 6),
                                )
                              : Text(
                                  "S T A R T",
                                  style: TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 6),
                                ),
                        ),
                      ),
                    ),
                        IconButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => 
                              ShopPage(
                                score: score,
                                updatePurchase: updatePurchase,
                              
                                )
                              )
                            )
                          );
                          }, 
                          icon: Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                            size: 30,
                          )
                        ),
                       
                      ],
                    ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backgroundPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: GestureDetector(
                      onVerticalDragUpdate: (details) {
                        if (details.delta.dy > 0) {
                          direction = "down";
                        } else if (details.delta.dy < 0) {
                          direction = "up";
                        }
                      },
                      onHorizontalDragUpdate: (details) {
                        if (details.delta.dx > 0) {
                          direction = "right";
                        } else if (details.delta.dx < 0) {
                          direction = "left";
                        }
                      },
                      child: Container(
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: numberOfSquares,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: numberInRow),
                            itemBuilder: (BuildContext context, int index) {
                              if (player == index) {
                                if (!mouthClosed) {
                                  return Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Container(
                                        decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.yellow,
                                    )),
                                  );
                                } else {
                                  if (direction == "right") {
                                    return Horse(animationKey: 'right');
                                  } else if (direction == "up") {
                                    return Horse(animationKey: 'up');
                                  } else if (direction == "left") {
                                    return Horse(animationKey: 'left');
                                  } else if (direction == "down") {
                                    return Horse(animationKey: 'down');
                                  } else if (direction==''){
                                    return Horse(animationKey: '');
                                  }
                                }
                              } else if (soloBarriers.contains(index)) {
                                return MyBarrier(
                                  child: Image.asset('assets/fence/log_solo.png',
                                      fit: BoxFit.fill),
                                );
                              } else if (upBarriers.contains(index)) {
                                return MyBarrier(
                                  child: Image.asset('assets/fence/log_up.png',
                                      fit: BoxFit.fill),
                                );
                              } else if (leftCornerBarriers.contains(index)) {
                                return MyBarrier(
                                  child: Image.asset(
                                      'assets/fence/log_corner_left.png',
                                      fit: BoxFit.fill),
                                );
                              } else if (rightCornerBarriers.contains(index)) {
                                return MyBarrier(
                                  child: Image.asset(
                                      'assets/fence/log_corner_right.png',
                                      fit: BoxFit.fill),
                                );
                              } else if (middleBarriers.contains(index)) {
                                return MyBarrier(
                                  child: Image.asset('assets/fence/log_middle.png',
                                      fit: BoxFit.fill),
                                );
                              } else if (rightBarriers.contains(index)) {
                                return MyBarrier(
                                  child: Image.asset(
                                      'assets/fence/log_side_right.png',
                                      fit: BoxFit.fill),
                                );
                              } else if (leftBarriers.contains(index)) {
                                return MyBarrier(
                                  child: Image.asset('assets/fence/log_side_left.png',
                                      fit: BoxFit.fill),
                                );
                              } else if (food.contains(index) || !gameStarted) {
                                return Apple(path: fruitPath,);
                              } else {
                                return Container();
                              }
                              return null;
                            }),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    height: 45,
                    width: 170,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(   
                            height: 30,
                            child: Image.asset('assets/coin.png')
                        ),
                        Text(
                          ' : $gameScore',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
