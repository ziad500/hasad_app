import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/auth/presentation/controller/signup/user/sign_up_cubit.dart';

import '../../../../../../../core/di.dart' as di;

class SignUpMainScreen extends StatelessWidget {
  const SignUpMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<UserSignUpCubit>(),
      child: BlocBuilder<UserSignUpCubit, UserSignUpState>(
        builder: (context, state) {
          return PageView.builder(
            controller: UserSignUpCubit.get(context).pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => UserSignUpCubit.get(context).screens[index],
            onPageChanged: (value) => UserSignUpCubit.get(context).changepageViewIndex(value),
          );
        },
      ),
    );
  }
}
