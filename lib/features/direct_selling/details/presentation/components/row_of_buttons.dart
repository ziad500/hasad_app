import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/show_tax_dialog.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/features/chats/domain/model/user_model.dart';
import 'package:hasad_app/features/chats/presentation/screens/message_screen.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/controller/cubit/direct_selling_details_cubit.dart';
import 'package:hasad_app/features/profile/domain/models/profile_model.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DirectSellingRowOfButtons extends StatelessWidget {
  const DirectSellingRowOfButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DirectSellingDetailsCubit, DirectSellingDetailsState>(
      builder: (context, state) {
        DirectSellingDetailsCubit cubit = DirectSellingDetailsCubit.get(context);
        ProfileDataModel? user = cubit.directSellingDataModel?.owner;
        if (user?.id.toString() == Constants.userId) {
          return const SizedBox();
        }
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              if (cubit.directSellingDataModel?.subQuantity != "0")
                Expanded(
                    child: DefaultButton(
                  buttonName: LocaleKeys.buyNow.tr(),
                  buttonFunction: () => showTaxBottomSheet(context,
                      price: cubit.directSellingDataModel?.price,
                      totalPrice: cubit.directSellingDataModel?.priceAfterTax,
                      buttonFunction: () => cubit.buyDirectSelling()),
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
                                              image: cubit.directSellingDataModel?.images?[0].name,
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
              InkWell(
                onTap: () async {
                  await launchUrl(Uri.parse("tel:${cubit.directSellingDataModel?.owner?.phone}"));
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.red,
                  radius: 25,
                  child: SvgPicture.asset(
                    SVGManager.call,
                    height: 20,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
