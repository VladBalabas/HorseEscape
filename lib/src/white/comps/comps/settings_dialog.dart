import 'package:flutter/material.dart';

import 'pixel_font.dart';

class SettingsDialog extends StatefulWidget {
  final List<bool> choosedSettings;
  const SettingsDialog({super.key, required this.choosedSettings});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: 60,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Choose your food: ',
                style: pixelFont.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 0)
              ),
            SizedBox(height: 5),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        for (int i = 0; i < 4; i++) {
                          widget.choosedSettings[i] = (i == index);
                        }
                        Navigator.of(context).pop();
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      color: widget.choosedSettings[index]
                          ? Colors.grey
                          : Colors.grey[300],
                      child: Image.asset('assets/apples/apple$index.png'),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 16),
            Text('Choose your background: ',
                style: pixelFont.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 0)),
            SizedBox(height: 5),
            Container(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        for (int i = 4; i <= 7; i++) {
                          widget.choosedSettings[i] = (i == index + 4);
                        }
                        Navigator.of(context).pop();
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 140,
                      color: widget.choosedSettings[index + 4]
                          ? Colors.grey[500]
                          : Colors.grey[300],
                      child: Image.asset(
                        'assets/backgrounds/background$index.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
