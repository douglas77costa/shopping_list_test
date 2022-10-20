import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/layout_space.dart';
import '../../../../core/theme/text_style.dart';
import '../../domain/entities/item.dart';
import '../controllers/edit_item_controller.dart';

class EditItemBottomSheet extends StatefulWidget {
  EditItemBottomSheet({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  State<EditItemBottomSheet> createState() => _EditItemBottomSheetState();
}

class _EditItemBottomSheetState extends State<EditItemBottomSheet> {
  final controller = Get.find<EditItemController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: AppBar().preferredSize.height),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [_header(), _body()],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: kToolbarHeight,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: Row(
              children: [
                const SizedBox(width: 48, height: 48),
                Expanded(
                  child: Center(
                    child: Text(
                      'Editar Item',
                      style: CustomTextStyle.spartanTextStyle(const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.defaultTextColor)),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    FluentIcons.dismiss_32_regular,
                    color: AppColors.redError,
                  ),
                )
              ],
            ),
          ),
        ),
        const Divider(
          height: 1,
          thickness: 0.5,
        ),
      ],
    );
  }

  Widget _body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: layoutSpace24, right: layoutSpace24, top: layoutSpace24),
          child: Form(
            key: controller.formKeyAdd,
            child: TextFormField(
              initialValue: widget.item.name,
              autofocus: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: controller.validateName,
              onChanged: (value) => controller.name = value,
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Nome do item'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: layoutSpace24, right: layoutSpace24, top: layoutSpace24),
          child: SizedBox(
            width: double.infinity,
            height: layoutSpace48,
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () =>
                  controller.updateItem(widget.item.check, widget.item.id),
              child: Text(
                'Salvar Item',
                style: CustomTextStyle.spartanTextStyle(
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: layoutSpace24,
              right: layoutSpace24,
              top: layoutSpace16,
              bottom: layoutSpace24),
          child: SizedBox(
            width: double.infinity,
            height: layoutSpace48,
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.redError,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () => controller.deleteItem(widget.item.id),
              child: Text(
                'Excluir Item',
                style: CustomTextStyle.spartanTextStyle(
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
