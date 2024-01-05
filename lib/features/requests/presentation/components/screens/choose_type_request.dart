import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/shared_list_tile.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base_container.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class ChooseTypeOfRequest extends StatelessWidget {
  const ChooseTypeOfRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        backFunction: () => Navigator.pop(context),
        number: "1",
        title: LocaleKeys.chooseBetween.tr(),
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) => b is SelectTypeState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);
            return AddRequestBaseContainer(
                buttonFunction: () {
                  cubit.pageController
                      .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                },
                body: Column(
                  children: [
                    SharedListTile(
                      dense: true,
                      title: LocaleKeys.directSale.tr(),
                      isSelected: cubit.selectedType == 1,
                      onTap: () => cubit.selectType(1),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SharedListTile(
                      dense: true,
                      title: LocaleKeys.auction.tr(),
                      isSelected: cubit.selectedType == 2,
                      onTap: () => cubit.selectType(2),
                    )
                  ],
                ));
          },
        ));
  }
}
