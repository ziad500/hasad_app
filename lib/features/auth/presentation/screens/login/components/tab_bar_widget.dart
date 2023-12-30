import '../../../../../../../utils/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../utils/app_colors.dart';
import '../../../controller/login_cubit/login_cubit.dart';

class LoginTabBarWidget extends StatelessWidget {
  const LoginTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              color: AppColors.unSelectedColor,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10).w, topRight: const Radius.circular(10).w)),
          height: 45.h,
          child: TabBar(
              onTap: (value) => LoginCubit.get(context).changeUserType(value),
              indicator: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10).w, topRight: const Radius.circular(10).w)),
              tabs: [
                Tab(
                  text: AppStrings.login.tr(),
                ),
                Tab(
                  text: AppStrings.serviceProvider.tr(),
                )
              ]),
        );
      },
    );
  }
}
