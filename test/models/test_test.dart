import 'package:flutter_test/flutter_test.dart';

// matcherを使ったテスト
void main() {
  int getValue() {
    return 1;
  }

  int? getNullable() {
    return 1;
  }

  int? getNull() {
    return null;
  }

  test("", () async {
    int i = 1;
    expect(i, isPositive);
    expect(-getValue(), isNegative);
    expect(getNullable(), isNonNegative);
    expect(-getValue(), isNonPositive);

    expect(getValue() + 0.1, equals(1.1));
  });
  test('数値の範囲指定', () async {
    expect(5, greaterThan(4)); // 5>4
    expect(5, greaterThanOrEqualTo(5)); // 5>=5

    expect(4, lessThan(5)); // 4<5
    expect(4, lessThanOrEqualTo(4)); // 4<=5

    expect(5, inInclusiveRange(4, 5)); // 4 ~ 5 == true
    expect(5, inExclusiveRange(4, 6)); // 4.1 ~ 5.9 == true

    expect(5, inClosedOpenRange(5, 6)); // 5 ~ 6 == true
    expect(5.1, inOpenClosedRange(5, 6)); // 5.1 ~ 6.0 == true

    expect(1, closeTo(2, 1)); // 1 == 2 +- 1 == true
    expect(2, closeTo(2, 1)); // 2 == 2 +- 1 == true
    expect(3, closeTo(2, 1)); // 3 == 2 +- 1 == true
    expect(4, closeTo(2, 1), skip: true); // 4 == 2 +- 1 == false

    expect(1 / 3, 0.3333333333333333);
    expect(1 / 3, closeTo(0.3333, 0.0001)); // 第二引数で誤差の範囲を指定。
  });

  test('文字列', () async {
    String text = "abcd";
    expect(text, "abcd");
    expect(text, contains("bc")); // 文字列に含まれるか。
    expect(text, startsWith("a")); // 最初の文字
    expect(text, endsWith("d")); // 最後の文字

    expect(text, equalsIgnoringCase("ABCD")); // 大文字、小文字の差を吸収。
    expect(" abcd ", equalsIgnoringWhitespace("abcd")); // 最初と最後の半角スペースを吸収。
    expect(text, stringContainsInOrder(['a', 'c', 'd']));

    expect(text, hasLength(4)); // 文字列の長さを取得
  });
  test("null", () async {
    int? nullableValue = getNullable();
    expect(nullableValue, 1);
    expect(nullableValue, isNotNull);

    int? nullValue = getNull();
    expect(nullValue, null);
    expect(nullValue, isNull);
  });
  test('exception', () async {
    Exception exception = Exception('hello world.');
    expect(exception, isException);

    expect(
      () {
        throw "string";
      },
      throwsA(isInstanceOf<String>()), // Stringがthrowされたのが確認できる。
    );

    expect(exception, isException);

    // この場合Exceptionのエラーメッセージが読めない。
    expect(
          () {
        throw Exception();
      },
      throwsA(isInstanceOf<Exception>()),// キャストして型を指定。
    );

    try{
      throw FormatException("exception text");
      fail("No Exception");
    }on FormatException catch(e) {
      expect(e.message, "exception text");
    }catch(e) {
      fail('unknow exception.');
    }
  });

  test('List', () async {
    List list = [1,2,3,4,5];

    expect(list, hasLength(5));
    expect(list.length, greaterThan(3)); // 3以上
    expect(list, contains(1)); // 1が含まれるか？
    expect(list, containsAll([1,2])); // 1と2が含まれるか？
    expect(list, containsAllInOrder([1,3,5])); // allInOrder内の要素がlist内に正しい並び順で存在するか？
    expect(list, orderedEquals([1,2,3,4,5]));// 全ての要素と並び順が一致。
    expect(list, unorderedEquals([3,2,1,4,5])); // 順番は関係無く要素が一致。

    
  });
}
