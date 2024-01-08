import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/common/icon_and_text_widget.dart';
import 'package:hasad_app/common/price_widget.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/core/timer/cubit/presentation/bidding_timer.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/app_decorations.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class MainItemWidget extends StatelessWidget {
  const MainItemWidget({super.key, required this.isbidding, required this.directSellingDataModel});
  final bool isbidding;
  final DirectSellingDataModel directSellingDataModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isbidding
          ? Navigator.pushNamed(context, Routes.biddingDetailsScreen,
              arguments: {"id": directSellingDataModel.id})
          : Navigator.pushNamed(context, Routes.itemDetailsRoutes,
              arguments: {"id": directSellingDataModel.id}),
      child: Container(
        width: double.maxFinite,
        decoration: AppDecorations.primaryDecoration,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Center(
                child: Image.network(
                  directSellingDataModel.images![0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //  _NetowrkImage(directSellingDataModel.images?[0]),
            const SizedBox(
              width: 10,
            ),
            Expanded(flex: 3, child: _Description(isbidding, directSellingDataModel))
          ],
        ),
      ),
    );
  }
}

class _BiddingDetails extends StatelessWidget {
  const _BiddingDetails(this.directSellingDataModel);
  final DirectSellingDataModel directSellingDataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 75.w,
      decoration: BoxDecoration(
          color: AppColors.amber,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Constants.isArabic ? 25 : 0),
              bottomRight: Radius.circular(Constants.isArabic ? 0 : 25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: DefaultText(
              text: LocaleKeys.totalBids.tr(),
              textStyle: TextStyle(fontSize: 10.sp, color: AppColors.darkBlue),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    SVGManager.bid,
                    height: 18.sp,
                    colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  DefaultText(
                      text: directSellingDataModel.numberOfAuctions == null
                          ? "0"
                          : directSellingDataModel.numberOfAuctions.toString(),
                      textStyle: TextStyle(fontSize: 15.sp, color: AppColors.red)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _NetowrkImage extends StatelessWidget {
  const _NetowrkImage(this.image);
  final String? image;

  @override
  Widget build(BuildContext context) {
    return NetworkImageWidget(
      image: image,
      imageBuilder: (_, image) => Container(
        width: 70.w,
        height: 100.h,
        decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover),
            color: Colors.green,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(Constants.isArabic ? 25 : 0),
                topRight: Radius.circular(Constants.isArabic ? 25 : 0),
                topLeft: Radius.circular(Constants.isArabic ? 0 : 25),
                bottomLeft: Radius.circular(Constants.isArabic ? 0 : 25))),
      ),
      errorWidget: Container(
        width: 70.w,
        height: 100.h,
        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description(this.isBidding, this.directSellingDataModel);
  final bool isBidding;
  final DirectSellingDataModel directSellingDataModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: TitleWidget(title: isEmpty(directSellingDataModel.title))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset(SVGManager.favorite),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SubTitleWidget(
                  maxlines: isBidding ? 2 : 3,
                  subTitle: isEmpty(directSellingDataModel.description)),
              const SizedBox(
                height: 5,
              ),
              if (isBidding) ...[
                _PriceRow(directSellingDataModel),
                const SizedBox(
                  height: 5,
                ),
              ],
              LocationAndPrice(
                  isBidding: isBidding, directSellingDataModel: directSellingDataModel),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        if (isBidding) _TimerWidget(directSellingDataModel),
      ],
    );
  }
}

class LocationAndPrice extends StatelessWidget {
  const LocationAndPrice(
      {super.key, required this.isBidding, required this.directSellingDataModel});
  final bool isBidding;
  final DirectSellingDataModel directSellingDataModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconAndText(
            svg: SVGManager.location,
            title:
                "${directSellingDataModel.region?.name} -${directSellingDataModel.city?.name} - ${directSellingDataModel.district?.name}",
            color: AppColors.blueAccent,
          ),
        ),
        if (!isBidding)
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: PriceWidget(price: isEmpty(directSellingDataModel.price)))
      ],
    );
  }
}

class _PriceRow extends StatelessWidget {
  const _PriceRow(this.directSellingDataModel);
  final DirectSellingDataModel directSellingDataModel;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            text:
                "${LocaleKeys.currentBidPrice.tr()} ${LocaleKeys.saudiRiyal.tr()} ${directSellingDataModel.auctionPrice}",
            textStyle: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.red),
          ),
          const SizedBox(
            width: 10,
          ),
          DefaultText(
            text:
                "${LocaleKeys.buyNow.tr()} ${LocaleKeys.saudiRiyal.tr()} ${directSellingDataModel.purchasingPrice}",
            textStyle: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.blue),
          ),
        ],
      ),
    );
  }
}

class _TimerWidget extends StatelessWidget {
  const _TimerWidget(this.directSellingDataModel);
  final DirectSellingDataModel directSellingDataModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: BiddingTimeObject(
                child: (value) => IconAndText(
                      widget: Expanded(
                        child: DefaultText(
                          text: value,
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      svg: SVGManager.clock,
                      title: "${LocaleKeys.endsIn.tr()}:  ",
                      color: AppColors.orangeColor,
                    ),
                date: DateTime.parse(directSellingDataModel.expiryTime
                        .toString()
                        .replaceAll(RegExp(r'\s[APap][Mm]$'), ''))
                    .toIso8601String()),
          ),
        ),
        _BiddingDetails(directSellingDataModel)
      ],
    );
  }
}
