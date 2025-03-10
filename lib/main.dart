import 'package:eat_like_app/core/constant/keys.dart';
import 'package:eat_like_app/presentation/presentation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

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
