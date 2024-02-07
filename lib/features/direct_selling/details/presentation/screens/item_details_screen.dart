import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:hasad_app/features/direct_selling/details/presentation/components/base/body.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/description_item.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/image_slider.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/location_widget.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/row_of_buttons.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/title_and_price.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/types.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/user_row.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/controller/cubit/direct_selling_details_cubit.dart';
import 'package:hasad_app/features/favorites/presentation/controller/cubit/favorites_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';
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
            floatingActionButton: const DirectSellingRowOfButtons(),
            actions: [
              BlocBuilder<DirectSellingDetailsCubit, DirectSellingDetailsState>(
                builder: (context, state) {
                  DirectSellingDetailsCubit cubit = DirectSellingDetailsCubit.get(context);

                  return cubit.directSellingDataModel?.owner?.id.toString() != Constants.userId
                      ? const SizedBox()
                      : InkWell(
                          onTap: () {
                            final result = Navigator.pushNamed(context, Routes.addRequestScreen,
                                arguments: cubit.directSellingDataModel);
                            result.then((value) {
                              if (value == true) {
                                cubit.getDirectSellingDetails(id);
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
              BlocBuilder<DirectSellingDetailsCubit, DirectSellingDetailsState>(
                builder: (context, state) {
                  if (DirectSellingDetailsCubit.get(context).directSellingDataModel != null) {
                    return BlocConsumer<FavoritesCubit, FavoritesState>(listener: (context, state) {
                      if (state is AddToFavoritesListErrorState) {
                        showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
                      }
                    }, builder: (context, state) {
                      FavoritesCubit cubit = FavoritesCubit.get(context);
                      return InkWell(
                        onTap: () => cubit.addToFav(
                            DirectSellingDetailsCubit.get(context).directSellingDataModel!),
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
              ),
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
                            isMine: cubit.directSellingDataModel?.owner?.id.toString() ==
                                Constants.userId,
                            list: [
                              cubit.directSellingDataModel?.video,
                              ...cubit.directSellingDataModel!.images!.map((e) => e.name).toList()
                            ],
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
