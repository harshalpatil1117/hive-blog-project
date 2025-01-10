import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_app/screens/dashboard/dashboard_screen.dart';
import 'package:hive_assets/gen/assets.gen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) {

      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
            (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      backgroundColor: theme.hiveColorsExtensions.background,
      body: Padding(
        padding: padding.all(Dimensions.medium),
        child: Center(
          child: HiveAssets.images.hiveBlogLogo.svg(
            height: 160,
          ),
        ),
      ),
    );
  }
}
