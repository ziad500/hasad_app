import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/wallet/presentation/components/cash_back_section.dart';
import 'package:hasad_app/features/wallet/presentation/components/get_mony_section/get_money_section.dart';
import 'package:hasad_app/features/wallet/presentation/components/recharge_section/recharge_section.dart';
import 'package:hasad_app/features/wallet/presentation/components/wallet_widget.dart';
import 'package:hasad_app/features/wallet/presentation/controller/cubit/wallet_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WalletCubit>(),
      child: LoadingFrame(
        loadingStates: [
          BlocBuilder<WalletCubit, WalletState>(
            builder: (context, state) {
              return state is CollectMoneyLoadingState ? const LoadingPage() : const SizedBox();
            },
          )
        ],
        child: DefaultScaffold(
            appbarTitle: LocaleKeys.wallet.tr(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: TitleWidget(
                      title: LocaleKeys.yourWallet.tr(),
                      size: 14.sp,
                      color: AppColors.blue,
                    ),
                  ),
                  const WalletWidget(),
                  const RechargeSection(),
                  const SizedBox(height: 16),
                  const GetMoneySection(),
                  const SizedBox(height: 16),
                  const CashBackSection(),
                  const SizedBox(height: 16),
                ],
              ),
            )),
      ),
    );
  }
}
