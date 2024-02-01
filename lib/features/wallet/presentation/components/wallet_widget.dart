import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/profile/domain/models/profile_model.dart';
import 'package:hasad_app/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        ProfileDataModel? model = ProfileCubit.get(context).profileDataModel;
        return Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: AppColors.addRequestContainerColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      TitleWidget(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          title: LocaleKeys.balance.tr()),
                      Flexible(
                        child: SubTitleWidget(
                          fontWeight: FontWeight.bold,
                          subTitle: LocaleKeys.purchaseReservedBalance.tr(),
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ],
                  )),
                  Flexible(
                    child: TitleWidget(
                      fontWeight: FontWeight.bold,
                      title: "${model?.balance ?? "0"} ${LocaleKeys.saudiRiyal.tr()}",
                      color: AppColors.darkBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TitleWidget(
                      fontWeight: FontWeight.bold,
                      title: LocaleKeys.reservedBalance.tr(),
                      color: AppColors.red,
                    ),
                  ),
                  Flexible(
                    child: TitleWidget(
                      fontWeight: FontWeight.bold,
                      title: "${model?.reservedBalance ?? "0"} ${LocaleKeys.saudiRiyal.tr()}",
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250.w,
                child: SubTitleWidget(
                  fontSize: 10.sp,
                  subTitle: LocaleKeys.reservedBalanceNote.tr(),
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
