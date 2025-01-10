import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:common/common.dart';
import 'package:hive_app/main.dart';

class CustomProgressDialog extends StatefulWidget {
  const CustomProgressDialog({super.key});

  @override
  State<CustomProgressDialog> createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<CustomProgressDialog> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.hiveColorsExtensions.background.withOpacity(0.8),
      height: MediaQuery.of(context).size.height,
      width: 70.0,
      alignment: Alignment.center,
      child: SpinKitFadingCircle(
        color: theme.hiveColorsExtensions.onBackground,
        size: 60.0,
      ),
    );
  }
}

class LoaderHelper {
  static bool isDialogShowing = false;

  static void showLoader() {
    if (!isDialogShowing) {
      isDialogShowing = true;
      if (navigatorKey.currentState != null) {
        showDialog(
          context: navigatorKey.currentState!.overlay!.context,
          barrierColor: Colors.transparent,
          builder: (BuildContext context) {
            return const CustomProgressDialog();
          },
        );
      }
    }
  }

  static void hideLoader() {
    if (isDialogShowing) {
      if (navigatorKey.currentState != null) {
        Navigator.pop(navigatorKey.currentState!.overlay!.context);
        isDialogShowing = false;
      }
    }
  }
}
