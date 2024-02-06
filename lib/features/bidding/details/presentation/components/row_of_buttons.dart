import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/show_tax_dialog.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/features/bidding/details/presentation/components/bid_bottom_sheet.dart';
import 'package:hasad_app/features/bidding/details/presentation/controller/cubit/bidding_details_cubit.dart';
import 'package:hasad_app/features/chats/domain/model/user_model.dart';
import 'package:hasad_app/features/chats/presentation/screens/message_screen.dart';
import 'package:hasad_app/features/profile/domain/models/profile_model.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

class BiddingRowOfButtons extends StatelessWidget {
  const BiddingRowOfButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BiddingDetailsCubit, BiddingDetailsState>(
      builder: (context, state) {
        if (state is GetBiddingDetailsLoadingState) {
          return const SizedBox();
        }
        BiddingDetailsCubit cubit = BiddingDetailsCubit.get(context);
        ProfileDataModel? user = cubit.directSellingDataModel?.owner;
        if (user?.id.toString() == Constants.userId) {
          return const SizedBox();
        }
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: DefaultButton(
                      buttonName: LocaleKeys.bidNow.tr(),
                      textColor: Colors.white,
                      color: AppColors.darkRed,
                      buttonFunction: () {
                        cubit.valueController.text =
                            cubit.directSellingDataModel?.lastBid?.value == null
                                ? "${cubit.directSellingDataModel!.auctionPrice}"
                                : "${cubit.directSellingDataModel!.lastBid!.value! + 100}";
                        showBidBottomSheet(context, cubit: cubit);
                      })),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: DefaultButton(
                buttonName: LocaleKeys.buyNow.tr(),
                buttonFunction: () => showTaxBottomSheet(context,
                    price: cubit.directSellingDataModel?.purchasingPrice,
                    note: LocaleKeys.buyBiddingNote.tr(),
                    totalPrice: cubit.directSellingDataModel?.priceAfterTax,
                    buttonFunction: () => cubit.buyBidding()),
                textColor: Colors.white,
                color: AppColors.darkBlue,
              )),
              if (user?.id.toString() != Constants.userId) ...[
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    if (user?.id != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessagesScreen(
                                    userChatModel: UserChatModel(
                                        image: cubit.directSellingDataModel?.images?[0].name,
                                        nameEn: cubit.directSellingDataModel?.title,
                                        nameAr: cubit.directSellingDataModel?.title,
                                        userId: user?.id.toString()),
                                  )));
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 25,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0).w,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              SVGManager.chats,
                              height: 20.sp,
                              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            ),
                            DefaultText(
                              text: LocaleKeys.contactSeller.tr(),
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 10.sp, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ],
          ),
        );
      },
    );
  }
}
