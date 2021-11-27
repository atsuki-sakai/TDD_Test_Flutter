import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_test/widgets/button.dart';
import 'package:tdd_test/widgets/keypad.dart';

void main() async {
  group("have numbers 0 ~ 9 to keyPads.", () {
    testWidgets("keyPad have numbers", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: KeyPad((text) => {}),
      ));
      await tester.pump();

      for (int i = 0; i < 10; i++) {
        expect(find.text(i.toString()), findsOneWidget);
      }
    });
    testWidgets("keyPad have text", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: KeyPad((text) => {}),
      ));
      await tester.pump();
      // アイコンでなく文字
      expect(find.text("C"), findsOneWidget);
      expect(find.text("."), findsOneWidget);
      // 文字でなくアイコン
      expect(find.byIcon(CupertinoIcons.plus_slash_minus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.equal), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.percent), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.plus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
    });
  });
  group("keypad tap test", () {
      testWidgets('numbers', (WidgetTester tester) async {
        String result = "";
        FuncOnPress onPress = (text) {
          result = result + text;
        };
        await tester.pumpWidget(MaterialApp(
          home: KeyPad(onPress),
        ));
        await tester.pump();

        await tester.tap(find.text("1"));
        await tester.tap(find.text("2"));
        await tester.tap(find.text("3"));
        await tester.tap(find.text("4"));
        await tester.tap(find.text("5"));
        await tester.tap(find.text("6"));
        await tester.tap(find.text("7"));
        await tester.tap(find.text("8"));
        await tester.tap(find.text("9"));
        await tester.tap(find.text("0"));
        expect(result, "1234567890");
      });

      testWidgets('text', (WidgetTester tester) async {
        String result = "";
        FuncOnPress onPress = (text) {
          result = result + text;
        };
        await tester.pumpWidget(MaterialApp(
          home: KeyPad(onPress),
        ));
        await tester.pump();

        await tester.tap(find.text("C"));
        await tester.tap(find.text("."));

        expect(result, "C.");
      });

      testWidgets("icon", (WidgetTester tester) async {
        String result = "";
        FuncOnPress onPress = (text) {
          result = result + text;
        };
        await tester.pumpWidget(MaterialApp(
          home: KeyPad(onPress),
        ));
        await tester.pump();

        await tester.tap(find.byIcon(CupertinoIcons.plus_slash_minus));
        await tester.tap(find.byIcon(CupertinoIcons.equal));
        await tester.tap(find.byIcon(CupertinoIcons.percent));
        await tester.tap(find.byIcon(CupertinoIcons.divide));
        await tester.tap(find.byIcon(CupertinoIcons.plus));
        await tester.tap(find.byIcon(CupertinoIcons.minus));
        expect(result, "+/-=%/+-");
      });
    });
}
