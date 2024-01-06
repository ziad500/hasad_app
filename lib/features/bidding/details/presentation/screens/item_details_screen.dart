import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_divider.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/bidding/details/presentation/controller/cubit/bidding_details_cubit.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/base/body.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/description_item.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/image_slider.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/location_widget.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/row_of_buttons.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/title_and_price.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/types.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/user_row.dart';
import 'package:hasad_app/utils/helpers.dart';

class BiddingDetailsScreen extends StatelessWidget {
  const BiddingDetailsScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<BiddingDetailsCubit>()..getBiddingList(id),
        child: ItemDetailsBody(
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
                      return ItemDetailsSlider(
                          currentIndex: cubit.currentIndex,
                          list: cubit.directSellingDataModel?.images,
                          onPageChanged: (index, _) => cubit.onSliderChanged(index));
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
                            UserRowWidget(
                                userModel: cubit.directSellingDataModel?.user,
                                date: isEmpty(cubit.directSellingDataModel?.createdAt)),
                            const SizedBox(
                              height: 20,
                            ),
                            const ItemRowOfButtons(),
                            const SizedBox(
                              height: 20,
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
