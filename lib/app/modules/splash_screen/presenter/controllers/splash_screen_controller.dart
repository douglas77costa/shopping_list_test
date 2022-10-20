import 'package:get/get.dart';

import '../../../../core/routes/pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    3.delay().whenComplete(() => Get.offAllNamed(Routes.home));
    super.onReady();
  }
}
