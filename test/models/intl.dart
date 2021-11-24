import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart' as intl;

void main() {
  test("TEST: 3-digit Sepalator", () {
    intl.NumberFormat formatter =
        intl.NumberFormat("#,###.############", "en_US");
    expect(formatter.format(123), "123");
    expect(formatter.format(1234), "1,234");
    expect(formatter.format(12345), "12,345");
    expect(formatter.format(123456), "123,456");
    expect(formatter.format(1234567), "1,234,567");
    expect(formatter.format(12345678), "12,345,678");
    expect(formatter.format(123456789), "123,456,789");
  });

  test('TEST: digit', () {
    intl.NumberFormat formatter =
        intl.NumberFormat("#,###.############", "en_US");
    expect(formatter.format(1.23), "1.23");
    expect(formatter.format(12.34), "12.34");
    expect(formatter.format(123.45), "123.45");
    expect(formatter.format(1234.56), "1,234.56");
    expect(formatter.format(12345.67), "12,345.67");
    expect(formatter.format(123.45678), "123.45678");
    expect(formatter.format(1.23456789), "1.23456789");
    // 0の桁数は増やせない。
    // expect(formatter.format(0.0), "0.0");
    // expect(formatter.format(0.00000), "0.00000");
    // expect(formatter.format(0.0000000000), "0.0000000000");
    expect(formatter.format(0.000001), "0.000001");
  });
}
