import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constants/pages.dart';
import 'constants/themes.dart';
import 'localization/localization.dart';
import 'services/alice_service.dart';
import 'services/app_lifecycle_service.dart';
import 'services/connectivity_service.dart';
import 'services/device_info_service.dart';
import 'services/dio_service.dart';
import 'services/logger_service.dart';
import 'services/package_info_service.dart';
import 'services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get
    ..put(LoggerService())
    ..put(AliceService());

  runApp(MakvicAuticiApp());
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(AppLifecycleService())
      ..put(DeviceInfoService())
      ..put(DioService())
      ..put(PackageInfoService())
      ..put(StorageService())
      ..put(ConnectivityService());
  }
}

class MakvicAuticiApp extends StatelessWidget {
  final logger = Get.find<LoggerService>();
  final alice = Get.find<AliceService>().alice;

  void loggingWithLogger(String text, {bool isError = false}) =>
      isError ? logger.e(text) : logger.d(text);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(412, 732),
        builder: (_, __) => GetMaterialApp(
          navigatorKey: alice.getNavigatorKey(),
          onGenerateTitle: (_) => 'appName'.tr,
          theme: MakvicAuticiThemes.lightTheme,
          darkTheme: MakvicAuticiThemes.darkTheme,
          initialRoute: MakvicAuticiRoutes.splashScreen,
          initialBinding: InitialBinding(),
          getPages: makvicAuticiPages,
          logWriterCallback: loggingWithLogger,
          locale: Localization.locale,
          fallbackLocale: Localization.fallbackLocale,
          translations: Localization(),
        ),
      );
}
