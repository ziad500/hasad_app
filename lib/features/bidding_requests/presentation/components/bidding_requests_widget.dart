import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/bidding_requests/domain/models/model.dart';
import 'package:hasad_app/features/bidding_requests/presentation/controller/bidding_requests_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/app_decorations.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class BiddingRequestsWidget extends StatelessWidget {
  const BiddingRequestsWidget({super.key, required this.model});
  final BiddingRequestsDataModel model;
  /*   1 pending 
            2 accept 
            3 reject */
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.biddingDetailsScreen,
            arguments: {"id": model.advertisementId});
      },
      child: Container(
        width: double.maxFinite,
        decoration: AppDecorations.primaryDecoration,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(title: isEmpty(model.title)),
                    ],
                  ),
                ),
                if (model.acceptedByOwner == 1)
                  Icon(Icons.pending, color: AppColors.yellow, size: 25.sp),
                if (model.acceptedByOwner == 2)
                  Icon(Icons.check_circle, color: Colors.green, size: 25.sp),
                if (model.acceptedByOwner == 3)
                  Icon(Icons.cancel, color: AppColors.darkRed, size: 25.sp)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: LocaleKeys.quantity.tr(),
                  textStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.darkRed),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: DefaultText(
                    text: isEmpty(model.quantity),
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: LocaleKeys.auctionDate.tr(),
                  textStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.darkRed),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: DefaultText(
                    text: isEmpty(model.biddingDate),
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: LocaleKeys.expiryDate.tr(),
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: AppColors.darkRed),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: DefaultText(
                        text: isEmpty(model.expiryTime),
                        textStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    )
                  ],
                )),
                const SizedBox(
                  width: 15,
                ),
                DefaultText(
                  text: " ${model.price} ${LocaleKeys.saudiRiyal.tr()}",
                  textStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.darkBlue),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (model.acceptedByOwner == 1)
              BlocBuilder<BiddingRequestsCubit, BiddingRequestsState>(
                builder: (context, state) {
                  if (state is GetAcceptOrRejectLoadingState) {
                    return const LoadingWidget();
                  }
                  return Row(
                    children: [
                      Expanded(
                          child: DefaultButton(
                              height: 45,
                              buttonName: LocaleKeys.accept.tr(),
                              buttonFunction: () {
                                BiddingRequestsCubit.get(context)
                                    .acceptOrReject(isAccept: true, id: model.id.toString());
                              })),
                      const SizedBox(width: 15),
                      Expanded(
                          child: DefaultButton(
                        height: 45,
                        buttonName: LocaleKeys.reject.tr(),
                        buttonFunction: () {
                          BiddingRequestsCubit.get(context)
                              .acceptOrReject(isAccept: false, id: model.id.toString());
                        },
                        color: AppColors.red,
                      ))
                    ],
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}
