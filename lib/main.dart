import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //! Number
  int numberGif = 1;

  //! Color
  Color defaultColor = Colors.black;

  //! Random
  void randomNumber() {
    numberGif = 2 + Random().nextInt(5 - 2);
  }

  //! Clear
  final textField = TextEditingController();
  void clearText() {
    textField.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background$numberGif.gif'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 35),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                Container(
                  child: Text(
                    'Ask Me Anything You Want',
                    style: TextStyle(
                        color: defaultColor,
                        fontSize: 23,
                        fontFamily: 'Pacifico'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 300, 20, 20),
                  child: TextField(
                    style: TextStyle(
                        color: defaultColor, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Ask Me',
                      labelStyle: TextStyle(fontSize: 15, color: defaultColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: defaultColor, width: 3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: textField,
                  ),
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      randomNumber();
                      defaultColor = Colors.white;
                    });
                  },
                  child: Text(
                    'Get Answer!',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      numberGif = 1;
                      defaultColor = Colors.black;
                      clearText();
                    });
                  },
                  child: Text(
                    'Ask Again',
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
