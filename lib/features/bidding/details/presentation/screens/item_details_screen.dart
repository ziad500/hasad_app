import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_divider.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/done_request_screen.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/core/func/payment_faild_dialog.dart';
import 'package:hasad_app/features/bidding/details/presentation/components/bidding_progress.dart';
import 'package:hasad_app/features/bidding/details/presentation/components/bidding_timer_widget.dart';
import 'package:hasad_app/features/bidding/details/presentation/components/bidding_widget.dart';
import 'package:hasad_app/features/bidding/details/presentation/components/row_of_buttons.dart';
import 'package:hasad_app/features/bidding/details/presentation/controller/cubit/bidding_details_cubit.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/base/body.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/description_item.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/image_slider.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/location_widget.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/title_and_price.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/types.dart';
import 'package:hasad_app/features/favorites/presentation/controller/cubit/favorites_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/date_helper.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class BiddingDetailsScreen extends StatelessWidget {
  const BiddingDetailsScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<BiddingDetailsCubit>()
          ..getBiddingDetails(id)
          ..listenToBid(),
        child: LoadingFrame(
          loadingStates: [
            BlocConsumer<BiddingDetailsCubit, BiddingDetailsState>(
              listener: (context, state) {
                if (state is BuyBiddingErrorState) {
                  paymentFaildDialog(context, text: state.error);
                }
                if (state is BuyBiddingSuccessState) {
                  navigateToDoneScreen(context,
                      title: LocaleKeys.processCompleted.tr(),
                      donePageState: DonePageState.done,
                      buttonText: LocaleKeys.myOrders.tr(),
                      subTitle: state.successModel.message!,
                      route: Routes.myOrdersScreen);
                }
              },
              builder: (context, state) {
                if (state is BuyBiddingLoadingState) {
                  return const LoadingPage();
                }
                return const SizedBox();
              },
            )
          ],
          child: ItemDetailsBody(
            floatingActionButton: const BiddingRowOfButtons(),
            actions: [
              BlocBuilder<BiddingDetailsCubit, BiddingDetailsState>(
                builder: (context, state) {
                  BiddingDetailsCubit cubit = BiddingDetailsCubit.get(context);

                  return cubit.directSellingDataModel?.owner?.id.toString() != Constants.userId
                      ? const SizedBox()
                      : InkWell(
                          onTap: () {
                            final result = Navigator.pushNamed(context, Routes.addRequestScreen,
                                arguments: cubit.directSellingDataModel);
                            result.then((value) {
                              if (value == true) {
                                cubit.getBiddingDetails(id);
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.circular(30)),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                children: [
                                  DefaultText(
                                      text: LocaleKeys.edit.tr(), color: AppColors.blueAccent),
                                  const SizedBox(width: 5),
                                  const Icon(Icons.edit, color: AppColors.blueAccent, size: 15),
                                ],
                              ),
                            ),
                          ),
                        );
                },
              ),
              BlocBuilder<BiddingDetailsCubit, BiddingDetailsState>(
                builder: (context, state) {
                  if (BiddingDetailsCubit.get(context).directSellingDataModel != null) {
                    return BlocConsumer<FavoritesCubit, FavoritesState>(listener: (context, state) {
                      if (state is AddToFavoritesListErrorState) {
                        showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
                      }
                    }, builder: (context, state) {
                      FavoritesCubit cubit = FavoritesCubit.get(context);
                      return InkWell(
                        onTap: () => cubit
                            .addToFav(BiddingDetailsCubit.get(context).directSellingDataModel!),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CircleAvatar(
                            backgroundColor: cubit.inFavList(id) ? Colors.red : Colors.white,
                            child: Icon(Icons.favorite_border,
                                color: cubit.inFavList(id) ? Colors.white : AppColors.primaryColor),
                          ),
                        ),
                      );
                    });
                  }
                  return const SizedBox();
                },
              )
            ],
            body: BlocBuilder<BiddingDetailsCubit, BiddingDetailsState>(
              buildWhen: (a, b) =>
                  b is GetBiddingDetailsSuccessState ||
                  b is GetBiddingDetailsErrorState ||
                  b is GetBiddingDetailsLoadingState ||
                  b is NewBidState,
              builder: (context, state) {
                BiddingDetailsCubit cubit = BiddingDetailsCubit.get(context);
                if (state is GetBiddingDetailsLoadingState) {
                  return const LoadingWidget();
                }
                if (state is GetBiddingDetailsErrorState) {
                  return Center(child: DefaultText(text: state.error));
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<BiddingDetailsCubit, BiddingDetailsState>(
                      buildWhen: (a, b) => b is ChangeIndexSliderstate,
                      builder: (context, state) {
                        return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ItemDetailsSlider(
                                isMine: cubit.directSellingDataModel?.owner?.id.toString() ==
                                    Constants.userId,
                                height: 250.h,
                                borderRadius: 0,
                                currentIndex: cubit.currentIndex,
                                list: [
                                  cubit.directSellingDataModel?.video,
                                  ...cubit.directSellingDataModel!.images!
                                      .map((e) => e.name)
                                      .toList()
                                ],
                                onPageChanged: (index, _) => cubit.onSliderChanged(index)),
                            BiddingNumbersWidget(
                              number: cubit.directSellingDataModel?.numberOfAuctions == null
                                  ? "0"
                                  : cubit.directSellingDataModel!.numberOfAuctions.toString(),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ItemLocationWidget(
                                  directSellingDataModel: cubit.directSellingDataModel),
                              const SizedBox(
                                height: 15,
                              ),
                              ItemDetailsTitleAndPrice(
                                  directSellingDataModel: cubit.directSellingDataModel),
                              const _DefaulDivider(),
                              TypeDetailsRowWidget(
                                  directSellingDataModel: cubit.directSellingDataModel),
                              const _DefaulDivider(),
                              DescriptionWidget(
                                  desc: isEmpty(cubit.directSellingDataModel?.description)),
                              const _DefaulDivider(),
                              SizedBox(
                                height: 20.h,
                              ),
                              BiddingProgressWidget(
                                  value: calculateTimePercentage(
                                          cubit.directSellingDataModel!.biddingDate.toString(),
                                          cubit.directSellingDataModel!.expiryTime.toString()) /
                                      100,
                                  directSellingDataModel: cubit.directSellingDataModel),
                              SizedBox(
                                height: 20.h,
                              ),
                              BiddingTimerWidget(
                                directSellingDataModel: cubit.directSellingDataModel,
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}

class _DefaulDivider extends StatelessWidget {
  const _DefaulDivider();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 10,
        ),
        DefaultDivider(),
      ],
    );
  }
}
