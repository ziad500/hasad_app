import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/core/timer/cubit/presentation/bidding_timer.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/date_helper.dart';
import 'package:hasad_app/utils/helpers.dart';

class BiddingTimerWidget extends StatelessWidget {
  const BiddingTimerWidget({super.key, this.directSellingDataModel});
  final DirectSellingDataModel? directSellingDataModel;
  @override
  Widget build(BuildContext context) {
    return !isDatePast(directSellingDataModel?.biddingDate)
        ? Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleWidget(title: "${LocaleKeys.startsIn.tr()} :"),
                const SizedBox(
                  width: 10,
                ),
                TitleWidget(
                    title: isEmpty(directSellingDataModel?.biddingDate),
                    color: AppColors.textPurple,
                    size: 18.sp,
                    fontWeight: FontWeight.bold),
              ],
            ),
          )
        : Center(
            child: BiddingTimeObject(
                child: (value) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TitleWidget(title: "${LocaleKeys.endsIn.tr()} :"),
                        const SizedBox(
                          width: 10,
                        ),
                        TitleWidget(
                            title: (value == "0:0:00:00" || directSellingDataModel?.closed == "1")
                                ? LocaleKeys.ended.tr()
                                : value,
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
