import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_divider.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/done_request_screen.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/wallet/presentation/components/recharge_section/main_item.dart';
import 'package:hasad_app/features/wallet/presentation/controller/cubit/wallet_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class GetMoneySection extends StatelessWidget {
  const GetMoneySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
          title: LocaleKeys.withdrawBalance.tr(),
          size: 14.sp,
          color: AppColors.primaryColor,
        ),
        const DefaultDivider(indent: 20),
        const SizedBox(height: 16),
        BlocConsumer<WalletCubit, WalletState>(
          listener: (context, state) {
            if (state is CollectMoneySuccessState) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DoneRequestScreen(
                          donePageState: DonePageState.done,
                          title: LocaleKeys.doneSend.tr(),
                          subTitle: state.successModel.message ?? "",
                          route: Routes.homeScreenRoutes)),
                  (route) => false);
            }
            if (state is CollectMoneyErrorState) {
              showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
            }
          },
          builder: (context, state) {
            WalletCubit cubit = WalletCubit.get(context);
            return WalletSubWidget(
              title: LocaleKeys.requestBalanceWithdrawal.tr(),
              color: AppColors.primaryColor,
              icon: SVGManager.cardAdd,
              onTap: () {
                cubit.collectMoney();
              },
            );
          },
        ),
      ],
    );
  }
}
