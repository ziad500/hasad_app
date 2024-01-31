import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/wallet/presentation/components/recharge_dialog.dart';
import 'package:hasad_app/features/wallet/presentation/components/upload_slip_main_item.dart';
import 'package:hasad_app/features/wallet/presentation/controller/cubit/wallet_cubit.dart';
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
              const SubTitleWidget(
                subTitle: "Make Sure that slip details is clear in order to be confirmed",
                color: AppColors.primaryColor,
              ),
              const SizedBox(height: 16),
              BlocBuilder<WalletCubit, WalletState>(
                builder: (context, state) {
                  WalletCubit cubit = WalletCubit.get(context);
                  return DefaultButton(
                    buttonName: "send",
                    buttonFunction: () {
                      rechargeDialog(context, walletCubit: cubit);
                    },
                  );
                },
              ),
            ],
          ),
        ),
        appbarTitle: "Upload Slip",
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubTitleWidget(
                subTitle: "Upload File",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              UploadSlipMainItem(),
            ],
          ),
        ),
      ),
    );
  }
}
