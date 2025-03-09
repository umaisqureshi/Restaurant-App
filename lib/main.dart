import 'package:eat_like_app/presentation/presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Db().init();
  runApp(ProviderScope(child: const MyApp()));
}
