import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/wallet/presentation/components/recharge_section/recharge_section.dart';
import 'package:hasad_app/features/wallet/presentation/components/wallet_widget.dart';
import 'package:hasad_app/features/wallet/presentation/controller/cubit/wallet_cubit.dart';
import 'package:hasad_app/utils/app_colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WalletCubit>(),
      child: DefaultScaffold(
          appbarTitle: "Wallet",
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: TitleWidget(
                    title: "المحفظة الخاصة بك",
                    size: 14.sp,
                    color: AppColors.blue,
                  ),
                ),
                const WalletWidget(),
                const RechargeSection(),
              ],
            ),
          )),
    );
  }
}
