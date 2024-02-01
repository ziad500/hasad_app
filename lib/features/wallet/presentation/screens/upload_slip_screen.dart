import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/wallet/presentation/components/recharge_dialog.dart';
import 'package:hasad_app/features/wallet/presentation/components/upload_slip_main_item.dart';
import 'package:hasad_app/features/wallet/presentation/controller/cubit/wallet_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

class UploadSlipScreen extends StatelessWidget {
  const UploadSlipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WalletCubit>(),
      child: DefaultScaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SubTitleWidget(
                subTitle: LocaleKeys.ensureReceiptDetailsClear.tr(),
                color: AppColors.primaryColor,
              ),
              const SizedBox(height: 16),
              BlocBuilder<WalletCubit, WalletState>(
                builder: (context, state) {
                  WalletCubit cubit = WalletCubit.get(context);
                  return DefaultButton(
                    buttonName: LocaleKeys.send.tr(),
                    buttonFunction: () {
                      rechargeDialog(context, walletCubit: cubit);
                    },
                  );
                },
              ),
            ],
          ),
        ),
        appbarTitle: LocaleKeys.uploadReceipt.tr(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubTitleWidget(
                subTitle: LocaleKeys.uploadFile.tr(),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              const UploadSlipMainItem(),
            ],
          ),
        ),
      ),
    );
  }
}
