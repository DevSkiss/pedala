import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pedala/core/presentation/widgets/pedala_button.dart';
import 'package:pedala/core/presentation/widgets/pedala_text.dart';

class DialogUtils {
  static void showDialogMessage(BuildContext context,
      {String? title, String? message, void Function()? onPressed}) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PedalaText.subheading(
              title ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            PedalaText.subheading(
              message ?? '',
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: PedalaButton(
                title: 'Okay',
                onTap: onPressed ?? Navigator.of(context).pop,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showLoading(BuildContext context,
      {String? title, String? message, void Function()? onPressed}) {
    showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            PedalaText.subheading(
              'Please wait',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }

  static void showRating(BuildContext context,
      {String? title, String? message, void Function()? onPressed}) {
    showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const PedalaText.subheading(
              'Please rate your Order',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            RatingBar.builder(
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                debugPrint(rating.toString());
              },
            ),
            const SizedBox(height: 20),
            PedalaButton(
              title: 'Confirm Rating',
              onTap: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
