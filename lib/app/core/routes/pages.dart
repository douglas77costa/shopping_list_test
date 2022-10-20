import 'package:get/get.dart';

import '../../modules/home/home_binding.dart';
import '../../modules/home/presenter/pages/home_page.dart';
import '../../modules/splash_screen/presenter/pages/splash_screen_page.dart';
import '../../modules/splash_screen/splash_screen_binding.dart';

part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.zoom,
    ),
  ];
}
