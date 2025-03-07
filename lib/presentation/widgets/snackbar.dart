import 'package:eat_like_app/presentation/presentation.dart';

class SnackbarWidget {
  showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),

        duration: Duration(seconds: 3), // SnackBar visibility duration
        behavior: SnackBarBehavior
            .floating, // Optional: Makes it float above other widgets
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Optional: Rounded corners
        ),
      ),
    );
  }
}
