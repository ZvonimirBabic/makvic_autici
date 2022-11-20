import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import 'splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: MakvicAuticiColors.primaryBlue,
        body: Obx(
          () => AnimatedAlign(
            duration: const Duration(seconds: 1),
            alignment: controller.alignment,
            curve: Curves.easeOutBack,
            child: Image.asset(
              MakvicAuticiAssets.splashScreenGif,
            ),
          ),
        ),
      );
}
