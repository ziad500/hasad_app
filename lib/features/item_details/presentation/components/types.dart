import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/utils/app_colors.dart';

class TypeDetailsRowWidget extends StatelessWidget {
  const TypeDetailsRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: _Item()),
        SizedBox(
          width: 15.w,
        ),
        const Expanded(child: _Item()),
        SizedBox(
          width: 15.w,
        ),
        const Expanded(child: _Item())
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWidget(title: "نوع الزراعة"),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 60.h,
          width: 70.w,
          decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(8)),
        ),
        const SizedBox(
          height: 10,
        ),
        const SubTitleWidget(subTitle: "محمى")
      ],
    );
  }
}
