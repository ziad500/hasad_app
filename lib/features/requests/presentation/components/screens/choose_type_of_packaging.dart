import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/shared_radio_button.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base_container.dart';
import 'package:hasad_app/features/requests/presentation/components/base/network_image.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';

class TypeOfPackagingScreen extends StatelessWidget {
  const TypeOfPackagingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "6",
        title: "نوع التغليف",
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) => b is SelectPackagingState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);
            return AddRequestBaseContainer(
                buttonFunction: () {
                  cubit.pageController
                      .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                },
                body: DefaultListView(
                    itemBuilder: (ontext, index) => SharedCheckBoxButton(
                          title: "النقل",
                          image: const RequestImageWidget(),
                          isSelected: cubit.selectedPackaging.contains(index.toString()),
                          onChanged: (value) => cubit.selectPackaging(index.toString()),
                        ),
                    count: 10));
          },
        ));
  }
}
