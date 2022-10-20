import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_list_test/app/app_widget.dart';

import 'app/modules/home/infra/model/item_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  loadUi();
  await _initHive();
  runApp(const AppWidget());
}

void loadUi() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
}

Future _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ItemModelAdapter());
  await Hive.openBox<ItemModel>('item');
  await Hive.openBox<int>('id');
}
