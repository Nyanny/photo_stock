import 'package:flutter/material.dart';
import 'package:photo_stock/assets/app_styles.dart';
import 'package:photo_stock/assets/res_consts.dart';

/// Class [BackButtonWidget] is the custom BackButton that is the textButton that produces [Navigator.pop]
class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.transparent,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        AppStrings.backButtonTitle,
        style: AppTextStyles.manrope16h22w500White,
      ),
    );
  }
}
