import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/pages.dart';
import '../../services/logger_service.dart';

class SplashScreenController extends GetxController {
  ///
  /// DEPENDENCIES
  ///

  final logger = Get.find<LoggerService>();

  ///
  /// INIT
  ///

  @override
  Future<void> onInit() async {
    super.onInit();
    _startAnimation();
  }

  ///
  /// VARIABLES
  ///

  final Rx<Alignment> _alignment = Alignment.bottomCenter.obs;

  ///
  /// GETTERS
  ///

  Alignment get alignment => _alignment.value;

  ///
  /// SETTERS
  ///

  ///
  /// METHODS
  ///

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _alignment.value = Alignment.center;
    });
    Future.delayed(const Duration(seconds: 3), _finishAnimation);
  }

  void _finishAnimation() {
    Get.offAllNamed(MakvicAuticiRoutes.homeScreen);
  }
}
