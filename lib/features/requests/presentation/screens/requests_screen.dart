import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';

import '../../../../../../../core/di.dart' as di;

class AddRequestScreen extends StatelessWidget {
  const AddRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AddRequestCubit>(),
      child: BlocBuilder<AddRequestCubit, AddRequestState>(
        builder: (context, state) {
          return PageView.builder(
            controller: AddRequestCubit.get(context).pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => AddRequestCubit.get(context).screens[index],
            onPageChanged: (value) => AddRequestCubit.get(context).changepageViewIndex(value),
          );
        },
      ),
    );
  }
}