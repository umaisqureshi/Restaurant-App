import 'package:eat_like_app/core/core.dart';

class TextHelper {
  static Widget textFormat24(
      {required String text, required Color color, bool isBold = false}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 24,
          color: color,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }

  static Widget textFormat18(
      {required String text, required Color color, bool isBold = false}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18,
          color: color,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }

  static Widget textFormat16(
      {required String text, required Color color, bool isBold = false}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          color: color,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }

  static Widget textFormat12(
      {required String text, required Color color, bool isBold = false}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
