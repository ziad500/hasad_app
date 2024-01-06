import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

class BiddingNumbersWidget extends StatelessWidget {
  const BiddingNumbersWidget({super.key, this.number});
  final String? number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Row(
        children: [
          SvgPicture.asset(
            SVGManager.bid,
            height: 20.sp,
          ),
          SizedBox(
            width: 10.w,
          ),
          DefaultText(
              text: number ?? "0",
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.grey,
                  ))
        ],
      ),
    );
  }
}
