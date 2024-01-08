import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_divider.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/bidding/details/presentation/components/bidding_progress.dart';
import 'package:hasad_app/features/bidding/details/presentation/components/bidding_timer_widget.dart';
import 'package:hasad_app/features/bidding/details/presentation/components/bidding_widget.dart';
import 'package:hasad_app/features/bidding/details/presentation/components/row_of_buttons.dart';
import 'package:hasad_app/features/bidding/details/presentation/controller/cubit/bidding_details_cubit.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/base/body.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/description_item.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/image_slider.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/location_widget.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/row_of_buttons.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/title_and_price.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/types.dart';
import 'package:hasad_app/utils/helpers.dart';

class BiddingDetailsScreen extends StatelessWidget {
  const BiddingDetailsScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<BiddingDetailsCubit>()..getBiddingList(id),
        child: ItemDetailsBody(
          floatingActionButton: const BiddingRowOfButtons(),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.favorite_border),
              ),
            )
          ],
          body: BlocBuilder<BiddingDetailsCubit, BiddingDetailsState>(
            buildWhen: (a, b) =>
                b is GetBiddingDetailsSuccessState ||
                b is GetBiddingDetailsErrorState ||
                b is GetBiddingDetailsLoadingState,
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
                              height: 250.h,
                              borderRadius: 0,
                              currentIndex: cubit.currentIndex,
                              list: cubit.directSellingDataModel?.images,
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
                                value: 0.3, directSellingDataModel: cubit.directSellingDataModel),
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
