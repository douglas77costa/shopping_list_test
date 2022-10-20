import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_list_test/app/modules/home/presenter/controllers/add_item_controller.dart';

import '../../../../core/shared/enums/status_type.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/layout_space.dart';
import '../../../../core/theme/text_style.dart';
import '../../../../core/widgets/empty_results_widget.dart';
import '../../../../core/widgets/filled_text_field.dart';
import '../../domain/usecases/save_item_usecase_impl.dart';
import '../controllers/home_controller.dart';
import '../widgets/add_item_bottom_sheet.dart';
import '../widgets/item_card.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Lista de Compras",
          style: CustomTextStyle.spartanTextStyle(const TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white)),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: AppColors.primary,
        ),
        backgroundColor: AppColors.primary,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Container(
              padding: const EdgeInsets.only(
                  left: layoutSpace16,
                  right: layoutSpace16,
                  bottom: layoutSpace24),
              child: FilledTextField(
                autofocus: false,
                keyboardType: TextInputType.text,
                hintText: 'Pesquisar aqui...',
                onChanged: (query) => controller.search(query),
                suffixIcon: IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      //controller.search();
                    },
                    icon: const Icon(
                      FluentIcons.search_24_filled,
                      color: AppColors.secondary,
                    )),
              ),
            )),
        actions: [
          IconButton(
              iconSize: 40,
              onPressed: () {
                showAddBottomSheet(context);
              },
              icon: const Icon(
                FluentIcons.add_circle_32_regular,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      body: PhysicalShape(
        elevation: 16,
        color: Colors.white,
        clipper: const ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
        ),
        child: Obx(() {
          switch (controller.status) {
            case StatusType.ERROR:
            case StatusType.LOAD:
              return const Center(child: CircularProgressIndicator());
            case StatusType.EMPTY:
              return const Center(
                child: EmptyResultsWidgets(
                  title: 'Nenhum item na lista, adicione no botão acima',
                ),
              );
            case StatusType.SUCCESS:
              return Obx(() {
                return ListView.builder(
                    itemCount: controller.itemList.length,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        item: controller.itemList[index],
                      );
                    });
              });
          }
          return Container();
        }),
      ),
    );
  }

  void showAddBottomSheet(BuildContext context) {
    Get.lazyPut(() => AddItemController(
          saveItemUseCase: Get.find<SaveItemUseCaseImpl>(),
        ));
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: true,
        builder: (context) {
          return const AddItemBottomSheet();
        }).whenComplete(() {
      controller.getItems();
      Get.delete<AddItemController>();
    });
  }
}
