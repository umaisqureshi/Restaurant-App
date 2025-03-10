import 'package:eat_like_app/presentation/presentation.dart';

final paymentRemoteServiceProvider = Provider<PaymentRemoteService>((ref) {
  return PaymentRemoteService();
});

final paymentNotifierProvider =
    StateNotifierProvider<PaymentNotifier, PaymentState>((ref) {
  final paymentRemoteService = ref.watch(paymentRemoteServiceProvider);
  return PaymentNotifier(paymentRemoteService: paymentRemoteService);
});
