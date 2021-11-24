import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

typedef FuncOnPress = void Function(String text);

class Button extends StatelessWidget {
  final String text;
  final Color colorButton;
  final Color colorText;

  final FuncOnPress onPressed;

  Button(this.text, this.colorButton, this.colorText, this.onPressed)
      : super(key: Key(text));

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ElevatedButton(
          child: Padding(
            padding: text == "0"
                ? const EdgeInsets.only(
                    left: 0, top: 20, right: 120, bottom: 20)
                : text.length == 1
                    ? const EdgeInsets.all(22)
                    : const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
            child: mapIcon.containsKey(text)
                ? Icon(
                    mapIcon[text],
                    size: 22,
                  )
                : Text(
                    text,
                    style: const TextStyle(fontSize: 22),
                  ),
          ),
          onPressed: () {
            onPressed(text);
          },
          style: ElevatedButton.styleFrom(
            primary: colorButton,
            onPrimary: colorText,
            shape: text == "0" ? const StadiumBorder() : const CircleBorder(),
          ),
        ));
  }
}
