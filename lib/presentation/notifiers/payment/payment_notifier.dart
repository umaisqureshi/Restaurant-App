import 'package:eat_like_app/presentation/presentation.dart';

class PaymentNotifier extends StateNotifier<PaymentState> {
  final PaymentRemoteService _paymentRemoteService;
  PaymentNotifier({required PaymentRemoteService paymentRemoteService})
      : _paymentRemoteService = paymentRemoteService,
        super(PaymentLoading());
  makePayment(int amount, String currency) async {
    try {
      await _paymentRemoteService.makePayment(amount, currency);
      await _paymentRemoteService.displayPaymentSheet().then((value) {
        if (value) {
          state = PaymentSuccess();
        } else {
          state = PaymentError();
        }
      });
    } catch (e) {
      state = PaymentError();
    }
  }
}
