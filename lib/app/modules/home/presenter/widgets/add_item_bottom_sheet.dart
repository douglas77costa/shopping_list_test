import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/layout_space.dart';
import '../../../../core/theme/text_style.dart';
import '../controllers/add_item_controller.dart';

class AddItemBottomSheet extends StatefulWidget {
  const AddItemBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddItemBottomSheet> createState() => _AddItemBottomSheetState();
}

class _AddItemBottomSheetState extends State<AddItemBottomSheet> {
  final controller = Get.find<AddItemController>();

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
                      'Adicionar Item',
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
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: double.infinity,
            height: layoutSpace48,
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () => controller.addItem(),
              child: Text(
                'Salvar Item',
                style: CustomTextStyle.spartanTextStyle(
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
