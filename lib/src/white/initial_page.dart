import 'package:flutter/material.dart';

import 'comps/comps/my_iconbutton.dart';
import 'comps/comps/pixel_font.dart';
import 'comps/comps/settings_dialog.dart';
import 'comps/sound_manager.dart';
import 'home_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with SingleTickerProviderStateMixin {
  SoundManager soundManager = SoundManager();
  List<bool> choosedSettings = [
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
  void dispose() {
    soundManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'assets/backgrounds/title_background1.png',
                    fit: BoxFit.fill,
                  )),
              Container(
                  alignment: Alignment(-0.7, 0.1),
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset(
                        'assets/horse/right/right1.png',
                        fit: BoxFit.fill,
                      ))),
              Container(
                  alignment: Alignment(0.4, 0.1),
                  child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'assets/apples/apple0.png',
                        fit: BoxFit.fill,
                      ))),
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                              choosedSettings: choosedSettings,
                                            )));
                      }, 
                      child: Text('PLAY', style: greatFont.copyWith(fontSize: 80, color:Colors.grey[100] ),)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyIconButton(
                          onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return SettingsDialog(choosedSettings: choosedSettings);
                                  },
                                );
                              },
                          icon1: Icons.menu, 
                          icon2: Icons.menu,
                          soundManager: soundManager
                        ),
                        MyIconButton(
                          onPressed: () {
                                setState(() {
                                  soundManager.toggleSound();
                                });
                              },
                          icon1: Icons.music_note, 
                          icon2: Icons.music_off, 
                          soundManager: soundManager
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
