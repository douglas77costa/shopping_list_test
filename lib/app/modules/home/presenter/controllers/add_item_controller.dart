import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/interfaces/domain/save_item_usecase.dart';
import '../../infra/model/item_model.dart';

class AddItemController extends GetxController{
  final SaveItemUseCase saveItemUseCase;
  AddItemController({required this.saveItemUseCase});

  final formKeyAdd = GlobalKey<FormState>();

  late String name;

  void addItem() async {
    if (formKeyAdd.currentState!.validate()) {
      var item = ItemModel(name: name, check: false, id: 0);
      var result = await saveItemUseCase.call(item);

      result.fold((error) {
        if (kDebugMode) {
          print(error);
        }
      }, (data) {
        Get.back();
      });
    }
  }

  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Insira o nome do item';
    }
    this.name = name;
    return null;
  }
}