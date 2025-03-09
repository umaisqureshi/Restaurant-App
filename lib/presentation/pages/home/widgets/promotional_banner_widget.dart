import 'package:eat_like_app/presentation/presentation.dart';

class PromotionalBannerWidget extends ConsumerWidget {
  const PromotionalBannerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.18,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.orange,
            Colors.yellowAccent,
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          _buildPromotionalImage(),
          _buildPromotionalContent(),
        ],
      ),
    );
  }

  Widget _buildPromotionalImage() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: ImageHelper.imageFromGallery(
        path: "boarding01.png",
        width: 120,
        height: 150,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildPromotionalContent() {
    return Positioned(
      top: 20,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHelper.textFormat18(
            text: "Best Deal For Today",
            color: Colors.black,
            isBold: true,
          ),
          const SizedBox(height: 4),
          TextHelper.textFormat12(
            text: "Grab your mouthwatering burger deal\nbefore it's gone!",
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          _buildPromotionalButton(),
        ],
      ),
    );
  }

  Widget _buildPromotionalButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextHelper.textFormat12(
        text: "Get 20% Off",
        color: Colors.white,
      ),
    );
  }
}
