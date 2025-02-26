import 'package:eat_like_app/core/core.dart';
import 'package:eat_like_app/presentation/presentation.dart';

class CartWidget extends ConsumerStatefulWidget {
  const CartWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends ConsumerState<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.teal,
            Colors.white,
            Colors.white,
          ],
          begin: Alignment.topCenter, // Gradient start point
          end: Alignment.bottomCenter, // Gradient end point
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: circularOption(
                    backgroundColor: Colors.white,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.teal,
                      size: 20,
                    ),
                    onPress: () {
                      context.pop();
                    }),
              ),
              TextHelper.textFormat18(
                  text: "Orders", color: Colors.white, isBold: true),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: circularOption(
                    backgroundColor: Colors.white,
                    icon: Icon(
                      Icons.delete,
                      color: Colors.teal,
                      size: 20,
                    ),
                    onPress: () {}),
              ),
            ],
          )
        ],
      ),
    );
  }
}
