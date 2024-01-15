import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_divider.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/done_request_screen.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/core/func/payment_faild_dialog.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/base/body.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/description_item.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/image_slider.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/location_widget.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/row_of_buttons.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/title_and_price.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/types.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/user_row.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/controller/cubit/direct_selling_details_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<DirectSellingDetailsCubit>()..getDirectSellingDetails(id),
        child: LoadingFrame(
          loadingStates: [
            BlocConsumer<DirectSellingDetailsCubit, DirectSellingDetailsState>(
              listener: (context, state) {
                if (state is BuyDirectSellingErrorState) {
                  paymentFaildDialog(context, text: state.error);
                }
                if (state is BuyDirectSellingSuccessState) {
                  navigateToDoneScreen(context,
                      title: LocaleKeys.processCompleted.tr(),
                      donePageState: DonePageState.done,
                      buttonText: LocaleKeys.myOrders.tr(),
                      subTitle: state.successModel.message!,
                      route: Routes.myOrdersScreen);
                }
              },
              builder: (context, state) {
                if (state is BuyDirectSellingLoadingState) {
                  return const LoadingPage();
                }
                return const SizedBox();
              },
            )
          ],
          child: ItemDetailsBody(
            floatingActionButton: const ItemRowOfButtons(),
            actions: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border),
                ),
              )
            ],
            body: BlocBuilder<DirectSellingDetailsCubit, DirectSellingDetailsState>(
              buildWhen: (a, b) =>
                  b is GetDirectSellingDetailsSuccessState ||
                  b is GetDirectSellingDetailsErrorState ||
                  b is GetDirectSellingDetailsLoadingState,
              builder: (context, state) {
                DirectSellingDetailsCubit cubit = DirectSellingDetailsCubit.get(context);
                if (state is GetDirectSellingDetailsLoadingState) {
                  return const LoadingWidget();
                }
                if (state is GetDirectSellingDetailsErrorState) {
                  return Center(child: DefaultText(text: state.error));
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<DirectSellingDetailsCubit, DirectSellingDetailsState>(
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
                                  userModel: cubit.directSellingDataModel?.owner,
                                  date: isEmpty(cubit.directSellingDataModel?.createdAt)),
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
