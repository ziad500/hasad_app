import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/custom_appbar_filter.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/components/direct_selling_list.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/cubit/direct_selling_list_dart_cubit.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class DirectSellingListScreen extends StatelessWidget {
  const DirectSellingListScreen({super.key, required this.categoryId, required this.categoryName});
  final String categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DirectSellingListCubit>()
        ..setDepartmentID(categoryId)
        ..getDirectSellingList(),
      child: DefaultScaffold(
          withAppbar: false,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                BlocBuilder<DirectSellingListCubit, DirectSellingListState>(
                  builder: (context, state) {
                    return CustomAppbarWithFilter(
                        name: categoryName,
                        onTap: () => Navigator.pushNamed(context, Routes.filterScreen, arguments: {
                              "buttonFunc": (GetMainListRequest value) async {
                                DirectSellingListCubit.get(context)
                                    .passGetMainListRequest(value)
                                    .then((value) {
                                  Navigator.pop(context);
                                  DirectSellingListCubit.get(context).getDirectSellingList();
                                });
                              }
                            }));
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Expanded(
                    child: DirectSellingListView(
                  expanded: false,
                ))
              ],
            ),
          )),
    );
  }
}
