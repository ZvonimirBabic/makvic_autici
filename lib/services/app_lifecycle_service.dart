import 'package:get/get.dart';

import 'logger_service.dart';

class AppLifecycleService extends FullLifeCycleController
    with FullLifeCycleMixin {
  ///
  /// DEPENDENCIES
  ///

  final logger = Get.find<LoggerService>();

  ///
  /// METHODS
  ///

  @override
  void onDetached() {
    logger.v('[ONDETACHED]');
  }

  @override
  void onInactive() {
    logger.v('[ONINACTIVE]');
  }

  @override
  void onPaused() {
    logger.v('[ONPAUSED]');
  }

  @override
  void onResumed() {
    logger.v('[ONRESUMED]');
  }
}
