import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/custom_appbar_filter.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/components/direct_selling_list.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/cubit/direct_selling_list_dart_cubit.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class DirectSellingListScreen extends StatelessWidget {
  const DirectSellingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DirectSellingListCubit>()..getDirectSellingList(),
      child: DefaultScaffold(
          withAppbar: false,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomAppbarWithFilter(
                    name: "خضار",
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.filterScreen, arguments: {"type": 1})),
                SizedBox(
                  height: 20.h,
                ),
                const Expanded(child: DirectSellingListView())
              ],
            ),
          )),
    );
  }
}
