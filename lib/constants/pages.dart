import 'package:get/get.dart';

import '../ui/splash/splash_screen_binding.dart';
import '../ui/splash/splash_screen_view.dart';

List<GetPage> makvicAuticiPages = <GetPage>[
  GetPage(
    name: MakvicAuticiRoutes.splashScreen,
    page: SplashScreenView.new,
    binding: SplashScreenBinding(),
  ),
];

class MakvicAuticiRoutes {
  static const splashScreen = '/splash_screen';
}
