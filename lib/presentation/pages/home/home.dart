import 'package:eat_like_app/presentation/presentation.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<PaymentState>(paymentNotifierProvider, (previous, next) {
      if (next is PaymentSuccess) {
        ref.read(cartNotifierProvider.notifier).clearCart();
        Future.delayed(const Duration(milliseconds: 100), () {
          ref.read(cartCountNotifier.notifier).getCartCount();
        });
      }
    });

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: _buildAppBar(context, ref),
          body: _buildHomeScreenContent(),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, WidgetRef ref) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 100),
      child: appBarWidget(context: context, ref: ref),
    );
  }

  Widget _buildHomeScreenContent() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        _buildHorizontalOptions(),
        const SizedBox(height: 20),
        _buildPromotionalBanner(),
        const SizedBox(height: 20),
        _buildTopRatedFoodHeader(),
        const SizedBox(height: 20),
        const ProductGridWidget(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildHorizontalOptions() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: HorizontalOptionsWidget(),
    );
  }

  Widget _buildPromotionalBanner() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: PromotionalBannerWidget(),
    );
  }

  Widget _buildTopRatedFoodHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextHelper.textFormat16(
        text: "Top Rated Food",
        color: Colors.black,
        isBold: true,
      ),
    );
  }
}
