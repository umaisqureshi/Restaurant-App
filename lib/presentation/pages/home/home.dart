import 'package:eat_like_app/presentation/pages/home/widgets/horizontal_options.dart';
import 'package:eat_like_app/presentation/presentation.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, 100),
              child: appBarWidget(ref: ref, context: context)),
          body: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: HorizontalOptionsWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
