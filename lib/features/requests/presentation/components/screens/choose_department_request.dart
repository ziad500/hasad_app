import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/category_item.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';

class ChooseDepartmentRequestScreen extends StatelessWidget {
  const ChooseDepartmentRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "2",
        title: "يرجي تحديد القسم",
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) => b is SelectDepartmentState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        width: 200.w,
                        padding: const EdgeInsets.all(20),
                        child: DefaultListView(
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  cubit.selectDepartment(index);
                                },
                                child: CategoryItem(isSelcted: cubit.selectedDepartment == index)),
                            count: 10)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DefaultButton(
                      buttonName: "التالي",
                      buttonFunction: () {
                        cubit.pageController.nextPage(
                            duration: const Duration(milliseconds: 500), curve: Curves.ease);
                      }),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            );
          },
        ));
  }
}
