import 'package:eat_like_app/presentation/presentation.dart';

Widget circularPortraitWidget({required String path, required Color color}) {
  return Container(
    height: 60,
    width: 60,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
    child: ImageHelper.imageFromGallery(path: path, height: 40, width: 40),
  );
}
