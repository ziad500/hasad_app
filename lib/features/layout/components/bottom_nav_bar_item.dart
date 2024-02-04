import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/features/profile/presentation/controller/cubit/profile_cubit.dart';
import '../cubit/layout_cubit.dart';
import '../../../utils/app_colors.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem(
      {super.key,
      this.title,
      required this.icon,
      this.fontSize = 14,
      required this.index,
      required this.cubit});
  final String? title;
  final String icon;
  final double fontSize;
  final int index;
  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: MaterialButton(
        splashColor: Colors.transparent,
        minWidth: 40,
        onPressed: () {
          if (index == 3) {
            ProfileCubit.get(context).getProfileData();
          }
          cubit.changeScreen(index);
        },
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
              cubit.currentTap == index ? AppColors.primaryColor : Colors.grey, BlendMode.srcIn),
        ),
      ),
    );
  }
}
