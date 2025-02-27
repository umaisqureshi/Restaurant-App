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

  static imageFromNetwork(
      {required String imageUrl,
      required BoxFit fit,
      double height = 50,
      double width = 50}) {
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
    );
  }
}


// return CachedNetworkImage(
//       imageUrl: imageUrl,
//       fit: fit,
//       height: height,
//       width: width,
//       placeholder: (context, url) => Center(
//           child: CircularProgressIndicator(
//         color: Colors.orange,
//       )),
//       errorWidget: (context, url, error) => Icon(Icons.error),
//     );