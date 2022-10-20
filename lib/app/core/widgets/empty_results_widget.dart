import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/colors.dart';
import '../theme/layout_space.dart';
import '../theme/text_style.dart';

class EmptyResultsWidgets extends StatelessWidget {
  const EmptyResultsWidgets({
    Key? key,
    this.title = '',
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/icon.svg',
                width: 150,
              ),
              const SizedBox(
                height: layoutSpace20,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: CustomTextStyle.spartanTextStyle(const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary)),
              ),
              const SizedBox(
                height: layoutSpace48,
              ),
            ]),
      ),
    );
  }
}
