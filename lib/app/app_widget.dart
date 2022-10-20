import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/pages.dart';
import 'core/theme/theme.dart';

class AppWidget extends StatelessWidget {

  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras',
      theme: appTheme(context),
      getPages: AppPages.pages,
      initialRoute: Routes.splashScreen,
    );
  }
}
