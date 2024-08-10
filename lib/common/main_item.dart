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
import 'package:hasad_app/features/favorites/presentation/components/add_to_fav_icon.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/app_decorations.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:hasad_app/utils/routes_manager.dart';
import 'package:hasad_app/utils/date_helper.dart';

class MainItemWidget extends StatelessWidget {
  const MainItemWidget(
      {super.key,
      required this.isbidding,
      required this.directSellingDataModel,
      this.mine = false});
  final bool isbidding;
  final DirectSellingDataModel directSellingDataModel;
  final bool mine;

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
        height: isbidding ? 170 : 130,
        decoration: AppDecorations.primaryDecoration,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            _NetowrkImage(
                directSellingDataModel.images?[0].name, isbidding, mine, directSellingDataModel),
            const SizedBox(width: 10),
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
      height: 35,
      width: 75,
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
              textStyle: const TextStyle(fontSize: 10, color: AppColors.darkBlue),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    SVGManager.bid,
                    height: 18,
                    colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  DefaultText(
                      text: directSellingDataModel.numberOfAuctions == null
                          ? "0"
                          : directSellingDataModel.numberOfAuctions.toString(),
                      textStyle: const TextStyle(fontSize: 15, color: AppColors.red)),
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
  const _NetowrkImage(this.image, this.isBidding, this.mine, this.model);
  final String? image;
  final bool isBidding;
  final bool mine;
  final DirectSellingDataModel? model;

  @override
  Widget build(BuildContext context) {
    return NetworkImageWidget(
      image: image,
      imageBuilder: (_, image) => Container(
        width: 90.w,
        height: isBidding ? 170 : 130,
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
        width: 90.w,
        height: isBidding ? 170 : 130,
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
                  Expanded(
                      child: TitleWidget(
                    title: isEmpty(directSellingDataModel.title),
                    size: 16,
                    maxlines: 1,
                  )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: FavoriteIcon(directSellingDataModel: directSellingDataModel))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SubTitleWidget(
                maxlines: 2,
                subTitle: isEmpty(directSellingDataModel.description),
                fontSize: 14,
              ),
              const SizedBox(
                height: 5,
              ),
              if (isBidding) ...[
                _PriceRow(directSellingDataModel),
                const SizedBox(
                  height: 5,
                ),
              ],
              if (!isBidding) SizedBox(height: 2.h),
              LocationAndPrice(
                  isBidding: isBidding, directSellingDataModel: directSellingDataModel),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        if (isBidding) const Spacer(),
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
            maxLines: 1,
            size: 13,
            svg: SVGManager.location,
            title:
                "${directSellingDataModel.region?.name} -${directSellingDataModel.city?.name} - ${directSellingDataModel.district?.name}",
            color: AppColors.blueAccent,
          ),
        ),
        if (!isBidding)
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: PriceWidget(price: isEmpty(directSellingDataModel.price), size: 15))
      ],
    );
  }
}

class _PriceRow extends StatelessWidget {
  const _PriceRow(this.directSellingDataModel);
  final DirectSellingDataModel directSellingDataModel;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 5,
      children: [
        DefaultText(
          text:
              "${LocaleKeys.currentBidPrice.tr()} ${LocaleKeys.saudiRiyal.tr()} ${directSellingDataModel.auctionPrice}",
          textStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.red, fontSize: 13),
        ),
        const SizedBox(
          height: 5,
        ),
        DefaultText(
          text:
              "${LocaleKeys.buyNow.tr()} ${LocaleKeys.saudiRiyal.tr()} ${directSellingDataModel.purchasingPrice}",
          textStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.blue, fontSize: 13),
        ),
      ],
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
            child: !isDatePast(directSellingDataModel.biddingDate)
                ? Center(
                    child: DefaultText(
                      text: LocaleKeys.startingSoon.tr(),
                      textAlign: TextAlign.center,
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.primaryColor, fontSize: 14),
                    ),
                  )
                : BiddingTimeObject(
                    child: (value) => IconAndText(
                          widget: Expanded(
                            child: DefaultText(
                              text: (value == "0:0:00:00" || directSellingDataModel.closed == "1")
                                  ? LocaleKeys.ended.tr()
                                  : value,
                              maxlines: 1,
                              textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: 14,
                                  color: AppColors.red,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          svg: SVGManager.clock,
                          title: "${LocaleKeys.endsIn.tr()}:  ",
                          size: 14,
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
