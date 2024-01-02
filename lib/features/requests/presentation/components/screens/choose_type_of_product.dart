import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/shared_list_tile.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base_container.dart';
import 'package:hasad_app/features/requests/presentation/components/base/network_image.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';

class ChooseTypeOfProductScreen extends StatelessWidget {
  const ChooseTypeOfProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "3",
        title: "يرجي تحديد النوع",
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) => b is SelectTypeOfProductState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);
            return AddRequestBaseContainer(
                buttonFunction: () {
                  cubit.pageController
                      .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                },
                body: DefaultListView(
                    itemBuilder: (ontext, index) => SharedListTile(
                          leading: const RequestImageWidget(),
                          large: true,
                          title: "بيع مباشر",
                          isSelected: cubit.selectedType == 0,
                          onTap: () => cubit.selectType(0),
                        ),
                    count: 10));
          },
        ));
  }
}
