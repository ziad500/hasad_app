import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/controller/cubit/direct_selling_details_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

class ItemRowOfButtons extends StatelessWidget {
  const ItemRowOfButtons({super.key, this.directSellingDataModel});
  final DirectSellingDataModel? directSellingDataModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DirectSellingDetailsCubit, DirectSellingDetailsState>(
      buildWhen: (a, b) => false,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: DefaultButton(
                buttonName: LocaleKeys.buyNow.tr(),
                buttonFunction: () => DirectSellingDetailsCubit.get(context).buyDirectSelling(),
                textColor: Colors.white,
                color: AppColors.darkBlue,
              )),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                  child: DefaultButton(
                      buttonName: LocaleKeys.contactSeller.tr(),
                      icon: SvgPicture.asset(SVGManager.chats),
                      buttonFunction: () {})),
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
