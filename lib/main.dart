import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:eat_like_app/presentation/presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = AppKeys.pubKey;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Db().init();
  runApp(ProviderScope(child: const MyApp()));
}
