import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class DefaultSWitchButton extends StatelessWidget {
  const DefaultSWitchButton({super.key, required this.onChanged, required this.value});
  final void Function(bool) onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.9,
      child: SizedBox(
        height: 10,
        width: 50,
        child: CupertinoSwitch(
          // overrides the default green color of the track
          activeColor: AppColors.textGrey.withOpacity(0.1),
          // color of the round icon, which moves from right to left
          thumbColor: value == true ? Colors.green : AppColors.textGrey.withOpacity(0.1),
          // when the switch is off
          trackColor: AppColors.primaryColor.withOpacity(0.15),
          // boolean variable value
          value: value,
          // changes the state of the switch
          onChanged: onChanged,
        ),
      ),
    );
  }
}
