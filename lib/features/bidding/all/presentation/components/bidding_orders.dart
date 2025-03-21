import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/core/pagenation/base_list_view.dart';
import 'package:hasad_app/features/bidding/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/bidding/all/presentation/components/items/bidding_order_widget.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/orders/cubit/bidding_orders_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

///pagenated list view to fetch all the reports
///the page contains 8 reports , the '_ReportsListViewState' will has a 'ScrollController' variable
///which will listen to the list if any scroll happen [in case that the current scroll position is equal to or bigger that .7 of total height
///the cubit will call the fetching method to fetch the next page , this will happen only if the current state is not loading state
///which indicates that no fetchng request is happening now]
class BiddingOrdersListView extends StatefulWidget {
  const BiddingOrdersListView({super.key, this.expanded = false});
  final bool expanded;

  @override
  State<BiddingOrdersListView> createState() => _BiddingOrdersListViewState();
}

class _BiddingOrdersListViewState extends State<BiddingOrdersListView> {
  //to be attched with the listview
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<BiddingOrdersCubit>(context);

    return BlocConsumer<BiddingOrdersCubit, BiddingOrdersState>(listener: (context, state) {
      if (state is BuyOrderAfterWinErrorState) {
        showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
      }
      if (state is BuyOrderAfterWinSuccessState) {
        cubit.biddingOrdersListModel = null;
        cubit.getBiddingList();
        showSnackbar(
            context: context, text: LocaleKeys.donePayment.tr(), state: ToastStates.SUCCESS);
      }
      if (state is ConfirmOrderErrorState) {
        showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
      }
      if (state is AuthConfirmOrderErrorState) {
        showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
      }
      if (state is AuthConfirmOrderSuccessState) {
        cubit.biddingOrdersListModel = null;
        cubit.getBiddingList();
        showSnackbar(context: context, text: LocaleKeys.doneSend.tr(), state: ToastStates.SUCCESS);
      }
      if (state is ConfirmOrderSuccessState) {
        cubit.biddingOrdersListModel = null;
        cubit.getBiddingList();
        showSnackbar(
            context: context,
            text: state.isReject ? LocaleKeys.doneReject.tr() : LocaleKeys.doneRecieve.tr(),
            state: ToastStates.SUCCESS);
      }
    }, builder: (context, state) {
      //pass the cubit ,states and items type '<BiddingOrdersCubit, BiddingListDartState, ReportModel>'
      String? getError() {
        if (state is GetBiddingOrdersListErrorState) {
          return state.error;
        }
        return null;
      }

      return PagenatedListView<BiddingOrdersCubit, BiddingOrdersState, BiddingOrderModel>(
        useExpanded: widget.expanded,
        //start listening to fetch the next page when scroll to .7 total height
        init: () => controller.addListener(() async {
          var percentageOftotalLength = 0.7 * controller.position.maxScrollExtent;
          var currentLength = controller.position.pixels;
          if (currentLength >= percentageOftotalLength &&
              cubit.state is! GetBiddingOrdersListPaginationLoadingState) {
            await cubit.getBiddingList();
          }
        }),
        controller: controller,
        //build this widget for the cureent screen
        childBuilder: (index) =>
            BiddingOrderWidget(biddingOrderModel: cubit.directSellingOrders[index]),
        items: cubit.directSellingOrders,
        //indicates that you do not has any other pages to fetch
        allCaught: state is BiddingOrdersListAllCaughtState,
        //indicates that you we currently fetching the next page
        isLoading: state is GetBiddingOrdersListPaginationLoadingState,
        mainLoading: state is GetBiddingOrdersListLoadingState,
        error: getError(),
        isError: state is GetBiddingOrdersListErrorState,
      );
    });
  }
}
