import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tdd_test/logic.dart';
import 'package:tdd_test/constants.dart';
import 'package:tdd_test/widgets/keypad.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String txtResult = "0";

  Logic _logic = Logic();

  Widget build(BuildContext context) {
    void onPress(String text) {
      _logic.input(text);
      setState(() {
        txtResult = _logic.text;
      });
    }

    return Scaffold(
      backgroundColor: colorMain,
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      txtResult,
                      key: Key("txtResult"),
                      style: const TextStyle(
                        color: colorText,
                        fontSize: 60,
                      ),
                      textAlign: TextAlign.right,
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
            KeyPad(onPress),
          ],
        ),
      ),
    );
  }
} // end of state class
