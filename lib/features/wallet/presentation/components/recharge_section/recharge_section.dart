import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_divider.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/wallet/presentation/components/recharge_dialog.dart';
import 'package:hasad_app/features/wallet/presentation/components/recharge_section/main_item.dart';
import 'package:hasad_app/features/wallet/presentation/controller/cubit/wallet_cubit.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class RechargeSection extends StatelessWidget {
  const RechargeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WalletCubit>(),
      child: Column(
        children: [
          TitleWidget(
            title: "شحن المحفظة",
            size: 14.sp,
            color: AppColors.blue,
          ),
          const DefaultDivider(indent: 20),
          const SizedBox(height: 16),
          BlocBuilder<WalletCubit, WalletState>(
            builder: (context, state) {
              WalletCubit cubit = WalletCubit.get(context);
              return WalletSubWidget(
                title: "شحن عن طريق البطاقة او STC",
                icon: SVGManager.cardAdd,
                onTap: () {
                  rechargeDialog(context, walletCubit: cubit, fromStc: true);
                },
              );
            },
          ),
          const SizedBox(height: 16),
          WalletSubWidget(
            title: "شحن عن طريق الإيداع",
            icon: SVGManager.receipt,
            onTap: () => Navigator.pushNamed(context, Routes.uploadSlipScreen),
          )
        ],
      ),
    );
  }
}
