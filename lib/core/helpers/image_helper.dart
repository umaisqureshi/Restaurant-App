import 'package:eat_like_app/core/core.dart';

class ImageHelper {
  static Widget imageFromGallery(
      {required String path,
      double height = 50,
      BoxFit fit = BoxFit.fitHeight,
      double width = double.infinity}) {
    return Image.asset(
      "assets/images/$path",
      height: height,
      width: width,
      fit: fit,
    );
  }
}
