import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/text_with_shadows.dart';
import 'package:hasad_app/common/user_image.dart';
import 'package:hasad_app/features/bidding/details/presentation/components/percentage_widget.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/helpers.dart';

class BiddingProgressWidget extends StatelessWidget {
  const BiddingProgressWidget(
      {super.key, required this.value, required this.directSellingDataModel});
  final DirectSellingDataModel? directSellingDataModel;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200.w,
        width: 200.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PercentageWidget(value: value),
            SizedBox(
              width: 180.w,
              height: 180.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWithShadowWidget(
                      maxlines: 1,
                      text: "سعر المزاد الان",
                      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.darkRed,
                          )),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextWithShadowWidget(
                      maxlines: 2,
                      text: "SAR ${directSellingDataModel?.auctionPrice} ",
                      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.darkRed,
                          )),
                  SizedBox(
                    height: 10.h,
                  ),
                  _UserWidget(
                    userModel: directSellingDataModel?.user,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _UserWidget extends StatelessWidget {
  const _UserWidget({this.userModel});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          UserImageWidget(
            radius: 20,
            imageUrl: userModel?.image,
          ),
          const SizedBox(
            width: 15,
          ),
          Flexible(
            child: TextWithShadowWidget(
                text: isEmpty(userModel?.name),
                maxlines: 3,
                textStyle: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.darkRed, overflow: TextOverflow.ellipsis)),
          ),
        ],
      ),
    );
  }
}
