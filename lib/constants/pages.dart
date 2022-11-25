import 'package:get/get.dart';

import '../ui/home/home_screen_binding.dart';
import '../ui/home/home_screen_view.dart';
import '../ui/splash/splash_screen_binding.dart';
import '../ui/splash/splash_screen_view.dart';

List<GetPage> makvicAuticiPages = <GetPage>[
  GetPage(
      name: MakvicAuticiRoutes.splashScreen,
      page: SplashScreenView.new,
      binding: SplashScreenBinding(),
      transition: Transition.noTransition),
  GetPage(
      name: MakvicAuticiRoutes.homeScreen,
      page: HomeScreenView.new,
      binding: HomeScreenBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300)),
];

class MakvicAuticiRoutes {
  static const splashScreen = '/splash_screen';
  static const homeScreen = '/home_screen';
}
