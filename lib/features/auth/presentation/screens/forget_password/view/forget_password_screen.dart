import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/di.dart' as di;
import '../../../controller/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ForgetPasswordCubit>(),
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          return PageView.builder(
            controller: ForgetPasswordCubit.get(context).pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ForgetPasswordCubit.get(context).screens[index],
            onPageChanged: (value) => ForgetPasswordCubit.get(context).changepageViewIndex(value),
          );
        },
      ),
    );
  }
}
