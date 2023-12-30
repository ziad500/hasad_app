import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../utils/app_strings.dart';
import '../../../../../../../../../utils/font_manager.dart';
import '../../../../../../../../../utils/values_manager.dart';

class ForgetPassword1Appbar extends StatelessWidget {
  const ForgetPassword1Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            AppStrings.resetPassword.tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: FontSize.s28),
          ),
        ),
        const SizedBox(
          height: AppSize.s12,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            AppStrings.enterYourEmail.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        )
      ],
    );
  }
}
