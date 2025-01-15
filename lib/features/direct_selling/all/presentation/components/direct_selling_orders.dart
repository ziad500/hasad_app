import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/core/pagenation/base_list_view.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/components/items/order_item.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/orders/cubit/direct_selling_orders_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

///pagenated list view to fetch all the reports
///the page contains 8 reports , the '_ReportsListViewState' will has a 'ScrollController' variable
///which will listen to the list if any scroll happen [in case that the current scroll position is equal to or bigger that .7 of total height
///the cubit will call the fetching method to fetch the next page , this will happen only if the current state is not loading state
///which indicates that no fetchng request is happening now]
class DirectSellingOrdersListView extends StatefulWidget {
  const DirectSellingOrdersListView({super.key, this.expanded = false});
  final bool expanded;

  @override
  State<DirectSellingOrdersListView> createState() => _DirectSellingOrdersListViewState();
}

class _DirectSellingOrdersListViewState extends State<DirectSellingOrdersListView> {
  //to be attched with the listview
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DirectSellingOrdersCubit>(context);

    return BlocConsumer<DirectSellingOrdersCubit, DirectSellingOrdersState>(
        listener: (context, state) {
      if (state is ConfirmOrderErrorState) {
        showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
      }
      if (state is ConfirmOrderSuccessState) {
        cubit.directSellingOrdersListModel = null;
        cubit.getDirectSellingList();
        showSnackbar(
            context: context, text: LocaleKeys.doneRecieve.tr(), state: ToastStates.SUCCESS);
      }
      if (state is ReCompleteOrderPaymentSuccessState) {
        if (cubit.selectedPaymentMethod == 1) {
          cubit.getDirectSellingList();
          Navigator.pop(context);
          showSnackbar(
              context: context, text: LocaleKeys.donePayment.tr(), state: ToastStates.SUCCESS);
        }
      }
      if (state is AuthConfirmOrderSuccessState) {
        cubit.directSellingOrdersListModel = null;
        cubit.getDirectSellingList();
        showSnackbar(context: context, text: LocaleKeys.doneSend.tr(), state: ToastStates.SUCCESS);
      }
      if (state is AuthConfirmOrderErrorState) {
        showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
      }
      if (state is ReCompleteOrderPaymentErrorState) {
        showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
      }
    }, builder: (context, state) {
      //pass the cubit ,states and items type '<DirectSellingOrdersCubit, DirectSellingListDartState, ReportModel>'
      String? getError() {
        if (state is GetDirectSellingOrdersListErrorState) {
          return state.error;
        }
        return null;
      }

      return PagenatedListView<DirectSellingOrdersCubit, DirectSellingOrdersState,
          DirectSellingOrderModel>(
        useExpanded: widget.expanded,
        //start listening to fetch the next page when scroll to .7 total height
        init: () => controller.addListener(() async {
          var percentageOftotalLength = 0.7 * controller.position.maxScrollExtent;
          var currentLength = controller.position.pixels;
          if (currentLength >= percentageOftotalLength &&
              cubit.state is! GetDirectSellingOrdersListPaginationLoadingState) {
            await cubit.getDirectSellingList();
          }
        }),
        controller: controller,
        //build this widget for the cureent screen
        childBuilder: (index) =>
            DirectSellingOrderWidget(directSellingOrderModel: cubit.directSellingOrders[index]),
        items: cubit.directSellingOrders,
        //indicates that you do not has any other pages to fetch
        allCaught: state is DirectSellingOrdersListAllCaughtState,
        //indicates that you we currently fetching the next page
        isLoading: state is GetDirectSellingOrdersListPaginationLoadingState,
        mainLoading: state is GetDirectSellingOrdersListLoadingState,
        isError: state is GetDirectSellingOrdersListErrorState,
        error: getError(),
      );
    });
  }
}
