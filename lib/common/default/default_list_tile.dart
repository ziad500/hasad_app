import 'default_text.dart';
import 'package:flutter/material.dart';

class DefaultListTile extends StatelessWidget {
  const DefaultListTile(
      {super.key, this.leading, required this.title, this.dense, this.onTap, this.iconBehindTitle});
  final Widget? leading;
  final String title;
  final bool? dense;
  final Widget? iconBehindTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: dense,
      onTap: onTap,
      leading: leading,
      title: Row(
        children: [
          Flexible(
            child: DefaultText(
              text: title,
              textStyle: Theme.of(context).textTheme.titleMedium,
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
