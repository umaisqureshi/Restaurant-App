import 'package:eat_like_app/data/data.dart';

class TotalCalculatorHelper {
  static int totalCalculator(List<CartEntity> items) {
    double total = 0;

    for (CartEntity item in items) {
      total = total + (item.price * item.quantity);
    }

    return total.floor();
  }

  static double getFivePercentTax(int subTotal) {
    return (subTotal * 0.05).roundToDouble();
  }
}
