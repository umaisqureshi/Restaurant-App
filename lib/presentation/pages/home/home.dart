import 'package:eat_like_app/presentation/pages/home/widgets/product_grid_widget.dart';
import 'package:eat_like_app/presentation/presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, 100),
              child: appBarWidget(context: context)),
          body: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: HorizontalOptionsWidget(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PromotionalBannerWidget(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextHelper.textFormat16(
                    text: "Top Rated Food", color: Colors.black, isBold: true),
              ),
              const SizedBox(
                height: 20,
              ),
              ProductGridWidget(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
