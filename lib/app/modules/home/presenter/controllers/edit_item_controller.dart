import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/interfaces/domain/delete_item_usecase.dart';
import '../../domain/interfaces/domain/update_item_usecase.dart';
import '../../infra/model/item_model.dart';

class EditItemController extends GetxController {
  final DeleteItemUseCase deleteItemUseCase;
  final UpdateItemUseCase updateItemUseCase;

  EditItemController(
      {required this.deleteItemUseCase, required this.updateItemUseCase});

  final formKeyAdd = GlobalKey<FormState>();

  late String name;

  void updateItem(bool check, int id) async {
    if (formKeyAdd.currentState!.validate()) {
      var item = ItemModel(name: name, check: check, id: id);
      var result = await updateItemUseCase.call(item);

      result.fold((error) {
        if (kDebugMode) {
          print(error);
        }
      }, (data) {
        Get.back();
      });
    }
  }

  void deleteItem(int id) async {
    var result = await deleteItemUseCase.call(id);
    result.fold((error) {
      if (kDebugMode) {
        print(error);
      }
    }, (data) {
      Get.back();
    });
  }

  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Insira o nome do item';
    }
    this.name = name;
    return null;
  }
}
