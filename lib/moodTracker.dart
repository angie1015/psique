import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psique/main.dart';



class Mood extends StatefulWidget {
  @override
  _Mood createState() => _Mood();
}

class _Mood extends State<Mood> {
  List<bool> isSelected = [false, false, false, false];
  final mood = <int>[];
  final daily = <String>[];
  final controller = TextEditingController();
  void toggle(int index) {
    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
      if (buttonIndex == index) {
        isSelected[buttonIndex] = !isSelected[buttonIndex];
      } else {
        isSelected[buttonIndex] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black26,
        body: Container(
        height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/images/bkgnd_1.jpg'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Let us know how you are today...',
                textAlign: TextAlign.center,
                style: GoogleFonts.dancingScript(fontSize: 40, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 40.0,
              width: 200.0,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                      child: Image.asset('assets/images/1.png'),
                      color: isSelected[0] ? Colors.grey : Colors.transparent,
                      onPressed: () {
                        setState(() => toggle(0));
                      },
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                      child: Image.asset('assets/images/2.png'),
                      color: isSelected[1] ? Colors.grey : Colors.transparent,
                      onPressed: () {
                        setState(() => toggle(1));
                      },
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                      child: Image.asset('assets/images/3.png'),
                      color: isSelected[2] ? Colors.grey : Colors.transparent,
                      onPressed: () {
                        setState(() => toggle(2));
                      },
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                      child: Image.asset('assets/images/4.png'),
                      color: isSelected[3] ? Colors.grey : Colors.transparent,
                      onPressed: () {
                        setState(() => toggle(3));
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: TextField(
                  minLines: 5,
                  maxLines: 10,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Write it down here',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                    filled: true,
                    fillColor: Color(0xFFDBEDFF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  controller: controller,
                ),
              ),
            ),
           ],
         ),

      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              for (int buttonIndex = 0;
              buttonIndex < isSelected.length;
              buttonIndex++) {
                if (isSelected[buttonIndex] == true) {
                  mood.add(buttonIndex);
                }
              }
              daily.add(controller.text);
              controller.clear();
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeRoute()));
            });
          },
          child: Icon(Icons.check),
        ),
    ));
  }
}