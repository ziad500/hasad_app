import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/features/bidding/details/presentation/controller/cubit/bidding_details_cubit.dart';
import 'package:hasad_app/features/chats/domain/model/user_model.dart';
import 'package:hasad_app/features/chats/presentation/screens/message_screen.dart';
import 'package:hasad_app/features/profile/domain/models/profile_model.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

class ItemRowOfButtons extends StatelessWidget {
  const ItemRowOfButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BiddingDetailsCubit, BiddingDetailsState>(
      buildWhen: (a, b) => false,
      builder: (context, state) {
        BiddingDetailsCubit cubit = BiddingDetailsCubit.get(context);
        ProfileDataModel? user = cubit.directSellingDataModel?.owner;

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: DefaultButton(
                buttonName: LocaleKeys.buyNow.tr(),
                buttonFunction: () {},
                textColor: Colors.white,
                color: AppColors.darkBlue,
              )),
              if (user?.id.toString() != Constants.userId) ...[
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                    child: DefaultButton(
                        buttonName: LocaleKeys.contactSeller.tr(),
                        icon: SvgPicture.asset(SVGManager.chats),
                        buttonFunction: () {
                          if (user?.id != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MessagesScreen(
                                          userChatModel: UserChatModel(
                                              image: cubit.directSellingDataModel?.images?[0],
                                              nameEn: cubit.directSellingDataModel?.title,
                                              nameAr: cubit.directSellingDataModel?.title,
                                              userId: user?.id.toString()),
                                        )));
                          }
                        }))
              ],
              SizedBox(
                width: 15.w,
              ),
              CircleAvatar(
                backgroundColor: AppColors.red,
                radius: 25,
                child: SvgPicture.asset(
                  SVGManager.call,
                  height: 20,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
