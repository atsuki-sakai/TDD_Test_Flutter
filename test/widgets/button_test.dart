import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_test/widgets/button.dart';

void main() {

  group("Create Button", () {
    testWidgets("Button: 0", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Button("0", Colors.black, Colors.white, (String) {}),
        ),
      );
      await tester.pump();
      expect(find.text("0"), findsOneWidget);
      expect(find.text("1"), findsNothing);
    });
    testWidgets("Button: 1", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Button("1", Colors.black, Colors.white, (String) {}),
        ),
      );
      await tester.pump();
      expect(find.text("1"), findsOneWidget);
      expect(find.text("0"), findsNothing);
    });
  });

  group("onPressed Func", () {
    // 押された時に自身のテキストを返すかをテスト
    String result = "";
    FuncOnPress onPress = (String text){
      result = text;
    };

    testWidgets("1", (WidgetTester tester) async {
      // 仮想アプリを立ち上げButtonしかない。
      await tester.pumpWidget(MaterialApp(home: Button("1", Colors.black, Colors.white, onPress),));
      await tester.pump();
      expect(find.text("1"), findsOneWidget);
      expect(find.text("0"), findsNothing);
      expect(result, "");

      // POINT -  findで仮想アプリの"1"と言うテキストを探してタップする。
      await tester.tap(find.text("1"));
      expect(result, "1");
      result = "";
    });
    testWidgets("2", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Button("2", Colors.black, Colors.white, onPress),));
      await tester.pump();
      expect(find.text("2"), findsOneWidget);
      expect(find.text("1"), findsNothing);
      expect(result, "");
      await tester.tap(find.text("2"));
      expect(result, "2");
      result = "";
    });
    testWidgets("3", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Button("3", Colors.black, Colors.white, onPress),));
      await tester.pump();
      expect(find.text("3"), findsOneWidget);
      expect(find.text("2"), findsNothing);
      expect(result, "");
      await tester.tap(find.text("3"));
      expect(result, "3");
    });
  });
  
  group("Color", () {
    testWidgets("4", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Button("4", Colors.black, Colors.white, (String) {}),));
      await tester.pump();

      Material material = tester.widget(find.byType(Material));
      expect(material.color, Colors.black);
      expect(material.textStyle!.color, Colors.white);

    });
    testWidgets("5", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Button("5", Colors.white, Colors.black, (String) {}),));
      await tester.pump();

      Material material = tester.widget(find.byType(Material));
      expect(material.color, Colors.white);
      expect(material.textStyle!.color, Colors.black);
    });
  });

}
