import 'package:http/http.dart' as http;
import 'package:eat_like_app/data/data.dart';

class PaymentRemoteService {
  Map<String, dynamic>? paymentIntent;

  Future<void> makePayment(int amount, String currency) async {
    try {
      paymentIntent =
          await createPaymentIntent((amount * 100).toString(), currency);
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          googlePay: const PaymentSheetGooglePay(
              testEnv: true, currencyCode: "DE", merchantCountryCode: "DE"),
          merchantDisplayName: 'Umais',
        ),
      );
    } catch (e) {
      debugPrint("exception $e");
      if (e is StripeConfigException) {
        debugPrint("Stripe exception ${e.message}");
      } else {
        debugPrint("exception $e");
      }
    }
  }

  Future<bool> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      paymentIntent = null;
      debugPrint('Paid successfully');
      return true;
    } on StripeException catch (e) {
      debugPrint('Error: $e');
      return false;
    } catch (e) {
      debugPrint("Error in displaying");
      debugPrint('$e');
      return false;
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var secretKey = AppKeys.secretKey;
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      debugPrint('Payment Intent Body: ${response.body.toString()}');
      return jsonDecode(response.body.toString());
    } catch (err) {
      debugPrint('Error charging user: ${err.toString()}');
    }
  }
}
