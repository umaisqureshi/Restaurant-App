import 'package:eat_like_app/presentation/presentation.dart';

Widget cartWidget({
  required BuildContext context,
  required WidgetRef ref,
  required List<CartEntity> cartProducts,
}) {
  final cartCount = ref.watch(cartCountNotifier);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: buildCartList(cartProducts, context, ref)),
      _buildPaymentSummary(cartProducts),
      const SizedBox(height: 10),
      _buildOrderConfirmedButton(cartCount),
      const SizedBox(height: 20),
    ],
  );
}

Widget _buildPaymentSummary(List<CartEntity> items) {
  final int subTotal = TotalCalculatorHelper.totalCalculator(items);
  final double tax = TotalCalculatorHelper.getFivePercentTax(subTotal);
  final double total = subTotal + tax;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildPaymentRow("Subtotal", "€$subTotal"),
            _buildPaymentRow("Tax (5%)", "€$tax"),
            const Divider(color: Colors.grey),
            _buildPaymentRow("Total", "€$total", isBold: true),
          ],
        ),
      ),
    ),
  );
}

Widget _buildPaymentRow(String label, String value, {bool isBold = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextHelper.textFormat16(text: label, color: Colors.black, isBold: isBold),
      TextHelper.textFormat16(
          text: value, color: Colors.orange, isBold: isBold),
    ],
  );
}

Widget _buildOrderConfirmedButton(int cartCount) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextHelper.textFormat18(
              text: "Process order (items ${cartCount.toString()})",
              color: Colors.white,
              isBold: true,
            ),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    ),
  );
}
