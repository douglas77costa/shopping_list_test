import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shopping_list_test/app/modules/home/domain/errors/errors.dart';
import 'package:shopping_list_test/app/modules/home/infra/model/item_model.dart';

import '../../../../core/shared/enums/status_type.dart';
import '../../domain/entities/item.dart';
import '../../domain/interfaces/domain/get_all_item_usecase.dart';
import '../../domain/interfaces/domain/is_item_empty_usecase.dart';
import '../../domain/interfaces/domain/update_item_usecase.dart';

class HomeController extends GetxController {
  final UpdateItemUseCase updateItemUseCase;
  final GetAllItemUseCase getAllItemUseCase;
  final IsItemEmptyUseCase isItemEmptyUseCase;

  HomeController(
      {required this.getAllItemUseCase,
      required this.isItemEmptyUseCase,
      required this.updateItemUseCase});

  final _status = StatusType.EMPTY.obs;

  get status => _status.value;

  set status(value) => _status.value = value;

  final itemList = <Item>[].obs;

  @override
  void onReady() {
    getItems();
    super.onReady();
  }

  void getItems() async {
    var result = getAllItemUseCase.call();

    result.fold((error) {
      if (kDebugMode) {
        print(error);
      }
      if (error is EmptyResult) {
        itemList.clear();
        status = StatusType.EMPTY;
      }
    }, (data) {
      itemList.clear();
      itemList.addAll(data!);
      status = StatusType.SUCCESS;
    });
  }

  void updateItem(ItemModel itemModel) async {
    var result = await updateItemUseCase.call(itemModel);
    result.fold((error) {
      if (kDebugMode) {
        print(error);
      }
    }, (data) {
      int index = itemList.indexWhere((element) => element.id == itemModel.id);
      itemList[index] = itemModel;
    });
  }

  void search(String keyword) {
    final resultList = <Item>[].obs;
    if (keyword.isEmpty) {
      getItems();
    } else {
      resultList.clear();
      resultList.addAll(itemList.where((item) {
        if (item.name.isCaseInsensitiveContainsAny(keyword)) {
          return true;
        } else {
          return false;
        }
      }));
      if (resultList.isNotEmpty) {
        itemList.clear();
        itemList.addAll(resultList);
        status = StatusType.SUCCESS;
      } else {
        status = StatusType.EMPTY;
      }
    }
  }
}
