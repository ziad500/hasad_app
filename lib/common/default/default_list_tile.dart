import 'package:hasad_app/utils/app_colors.dart';

import 'default_text.dart';
import 'package:flutter/material.dart';

class DefaultListTile extends StatelessWidget {
  const DefaultListTile(
      {super.key,
      this.leading,
      required this.title,
      this.dense,
      this.onTap,
      this.iconBehindTitle,
      this.trailing});
  final Widget? leading;
  final String title;
  final bool? dense;
  final Widget? iconBehindTitle;
  final void Function()? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: dense,
      onTap: onTap,
      leading: leading,
      trailing: trailing,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: DefaultText(
              text: title,
              textStyle: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.addRequestContainerColor),
            ),
          ),
          if (iconBehindTitle != null) ...[
            const SizedBox(
              width: 10,
            ),
            iconBehindTitle!
          ]
        ],
      ),
    );
  }
}
