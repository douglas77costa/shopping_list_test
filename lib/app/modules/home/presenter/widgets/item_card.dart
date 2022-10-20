import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_list_test/app/core/theme/layout_space.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entities/item.dart';
import '../../domain/usecases/delete_item_usecase_impl.dart';
import '../../domain/usecases/update_item_usecase_impl.dart';
import '../../infra/model/item_model.dart';
import '../controllers/edit_item_controller.dart';
import '../controllers/home_controller.dart';
import 'edit_item_bottom_sheet.dart';

class ItemCard extends StatelessWidget {
  final controller = Get.find<HomeController>();
  final Item item;

  ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: layoutSpace16, right: layoutSpace16, top: layoutSpace16),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Material(
            borderRadius: BorderRadius.circular(12),
            type: MaterialType.card,
            elevation: 0,
            color: const Color(0xFFF7F7F7),
            child: ListTile(
              contentPadding: const EdgeInsets.only(
                  left: layoutSpace8, right: layoutSpace8),
              leading: Checkbox(
                value: item.check,
                activeColor: AppColors.secondary,
                onChanged: (bool? value) {
                  var model =
                      ItemModel(name: item.name, check: value!, id: item.id);
                  controller.updateItem(model);
                },
              ),
              title: Text(item.name),
              trailing: IconButton(
                icon: const Icon(FluentIcons.more_horizontal_20_regular),
                onPressed: () {
                  showEditBottomSheet(context);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showEditBottomSheet(BuildContext context) {
    Get.lazyPut(() => EditItemController(
          deleteItemUseCase: Get.find<DeleteItemUseCaseImpl>(),
          updateItemUseCase: Get.find<UpdateItemUseCaseImpl>(),
        ));
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: true,
        builder: (context) {
          return EditItemBottomSheet(
            item: item,
          );
        }).whenComplete(() {
      controller.getItems();
      Get.delete<EditItemController>();
    });
  }
}
