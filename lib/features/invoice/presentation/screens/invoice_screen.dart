import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/empty_list.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/logo_widget.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/invoice/domain/models/invoice_model.dart';
import 'package:hasad_app/features/invoice/presentation/components/calc_item.dart';
import 'package:hasad_app/features/invoice/presentation/controller/cubit/invoice_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

class DirectSellingInvoiceScreen extends StatelessWidget {
  const DirectSellingInvoiceScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<InvoiceCubit>()..getDirectSellingInvoice(id),
      child: BlocBuilder<InvoiceCubit, InvoiceState>(
        builder: (context, state) {
          InvoiceCubit cubit = InvoiceCubit.get(context);
          DirectSelligInvoiceModel? model = cubit.invoiceModel;

          return DefaultScaffold(
              appbarTitle: LocaleKeys.orderDetails.tr(),
              body: state is GetDirectSellingLoadingState
                  ? const LoadingWidget()
                  : (state is GetDirectSellingErrorState)
                      ? Center(child: Text(state.error))
                      : model == null
                          ? const EmptyList()
                          : Column(
                              children: [
                                _LogoAndData(invoiceModel: model),
                                _Description(invoiceModel: model),
                                _Summary(invoiceModel: model)
                              ],
                            ));
        },
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({this.invoiceModel});
  final DirectSelligInvoiceModel? invoiceModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          DefaultText(
            text: (invoiceModel?.data?.advertisement?.title ?? ""),
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 10.h,
          ),
          DefaultText(
            text: invoiceModel?.data?.advertisement?.description ?? "",
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.blue),
          ),
          SizedBox(
            height: 20.h,
          ),
          DefaultText(
              text:
                  "${invoiceModel?.data?.advertisement?.region?.name} -${invoiceModel?.data?.advertisement?.city?.name} - ${invoiceModel?.data?.advertisement?.district?.name}",
              textStyle:
                  Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.blueAccent))
        ],
      ),
    ));
  }
}

class _LogoAndData extends StatelessWidget {
  const _LogoAndData({this.invoiceModel});
  final DirectSelligInvoiceModel? invoiceModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Column(
        children: [
          const Logo(),
          SizedBox(
            height: 15.h,
          ),
          DefaultText(
              text: "${LocaleKeys.invoiceNumber.tr()} : ${invoiceModel?.data?.invoiceNumber ?? ""}",
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.red,
                  )),
          DefaultText(
              text: "${LocaleKeys.date.tr()} : ${invoiceModel?.data?.createdAt ?? ""}",
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.blueAccent,
                  )),
        ],
      ),
    ));
  }
}

class _Summary extends StatelessWidget {
  const _Summary({this.invoiceModel});
  final DirectSelligInvoiceModel? invoiceModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(20.0).w,
      child: Column(
        children: [
          CalcItem(title: LocaleKeys.quantity.tr(), value: "${invoiceModel?.data?.quantity ?? 1}"),
          SizedBox(
            height: 10.h,
          ),
          CalcItem(
              title: LocaleKeys.price.tr(),
              value: "${invoiceModel?.data?.subtotal ?? 0} ${LocaleKeys.saudiRiyal.tr()}"),
          SizedBox(
            height: 10.h,
          ),
          CalcItem(
              title: LocaleKeys.tax.tr(),
              value:
                  "${(invoiceModel!.data!.total! - invoiceModel!.data!.subtotal!).toStringAsFixed(2)} ${LocaleKeys.saudiRiyal.tr()}"),
          SizedBox(
            height: 10.h,
          ),
          CalcItem(
              title: LocaleKeys.totalPrice.tr(),
              value: "${invoiceModel?.data?.total ?? 0} ${LocaleKeys.saudiRiyal.tr()}"),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              InvoiceCubit.get(context).generatePDF(invoiceModel!);
            },
            child: Column(
              children: [
                const Icon(
                  Icons.download_for_offline_outlined,
                  color: AppColors.blueAccent,
                ),
                DefaultText(
                    text: "تحميل",
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.blueAccent,
                        )),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
