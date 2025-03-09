import 'package:eat_like_app/presentation/presentation.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              ImageHelper.imageFromGallery(
                path: "onboarding.jpg",
                height: double.infinity,
              ),
              Positioned(
                left: 5,
                top: MediaQuery.sizeOf(context).height * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 160,
                          child: Stack(
                            children: [
                              circularPortraitWidget(
                                  path: "boarding01.png", color: Colors.green),
                              Positioned(
                                  left: 40,
                                  child: circularPortraitWidget(
                                      path: "boarding02.png",
                                      color: Colors.yellow)),
                              Positioned(
                                  left: 80,
                                  child: circularPortraitWidget(
                                      path: "boarding03.png",
                                      color: Colors.blue)),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextHelper.textFormat24(
                        text: "Quick Bites", color: Colors.white, isBold: true),
                    TextHelper.textFormat24(
                        text: "Instant Cravings",
                        color: Colors.white,
                        isBold: true),
                    TextHelper.textFormat12(
                        text:
                            "Satisfy your food cravings with fast, delicious, \nand effortless delivery.",
                        color: Colors.white,
                        isBold: false),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            context.go("/home");
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: Size(
                                  MediaQuery.sizeOf(context).width * 0.9, 60),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: TextHelper.textFormat16(
                              text: "Continue",
                              color: Colors.black,
                              isBold: true)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
