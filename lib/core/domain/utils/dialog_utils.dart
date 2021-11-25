import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
}
