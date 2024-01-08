import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/core/timer/cubit/presentation/bidding_timer.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/utils/app_colors.dart';

class BiddingTimerWidget extends StatelessWidget {
  const BiddingTimerWidget({super.key, this.directSellingDataModel});
  final DirectSellingDataModel? directSellingDataModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BiddingTimeObject(
          child: (value) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TitleWidget(title: "ينتهي في :"),
                  const SizedBox(
                    width: 10,
                  ),
                  TitleWidget(
                      title: value == "0:0:00:00" ? "انتهي" : value,
                      color: AppColors.darkRed,
                      size: 18.sp,
                      fontWeight: FontWeight.bold),
                ],
              ),
          date: DateTime.parse(directSellingDataModel!.expiryTime
                  .toString()
                  .replaceAll(RegExp(r'\s[APap][Mm]$'), ''))
              .toIso8601String()),
    );
  }
}
