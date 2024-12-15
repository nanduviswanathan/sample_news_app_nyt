import 'dart:async';

import 'package:flutter/material.dart';

import '../../shared/constants/colors.dart';
import '../../shared/helper/app_images.dart';
import '../../shared/helper/route.dart';
import '../../shared/helper/sizes_helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double logoSize = displayWidth(context) * 0.8;
                return SizedBox(
                  width: logoSize,
                  height: logoSize,
                  child: Image.asset(
                    AppImages.splashScreenImage,
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateUser() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushAndRemoveUntil(
              createLoginRoute(), // Replace with your route creation logic
              (Route<dynamic> route) => false, // Remove all previous routes
            ));
  }
}
