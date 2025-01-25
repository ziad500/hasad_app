import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/core/pagenation/base_list_view.dart';
import 'package:hasad_app/features/sales_order/domain/models/model.dart';
import 'package:hasad_app/features/sales_order/presentation/components/sales_orders_widget.dart';
import 'package:hasad_app/features/sales_order/presentation/controller/sales_orders_cubit.dart';

///pagenated list view to fetch all the reports
///the page contains 8 reports , the '_ReportsListViewState' will has a 'ScrollController' variable
///which will listen to the list if any scroll happen [in case that the current scroll position is equal to or bigger that .7 of total height
///the cubit will call the fetching method to fetch the next page , this will happen only if the current state is not loading state
///which indicates that no fetchng request is happening now]
class SalesOrdersListView extends StatefulWidget {
  const SalesOrdersListView({super.key, this.expanded = false});
  final bool expanded;

  @override
  State<SalesOrdersListView> createState() => _SalesOrdersListViewState();
}

class _SalesOrdersListViewState extends State<SalesOrdersListView> {
  //to be attched with the listview
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SalesOrdersCubit>(context);

    return BlocBuilder<SalesOrdersCubit, SalesOrdersState>(builder: (context, state) {
      //pass the cubit ,states and items type '<SalesOrdersCubit, SalesOrdersListDartState, ReportModel>'
      String? getError() {
        if (state is GetSalesOrdersListErrorState) {
          return state.error;
        }
        return null;
      }

      return PagenatedListView<SalesOrdersCubit, SalesOrdersState, SalesOrdersDataModel>(
        useExpanded: widget.expanded,
        //start listening to fetch the next page when scroll to .7 total height
        init: () => controller.addListener(() async {
          var percentageOftotalLength = 0.7 * controller.position.maxScrollExtent;
          var currentLength = controller.position.pixels;
          if (currentLength >= percentageOftotalLength &&
              cubit.state is! GetSalesOrdersListPaginationLoadingState) {
            await cubit.getSalesOrdersList();
          }
        }),
        controller: controller,
        //build this widget for the cureent screen
        childBuilder: (index) => SalesOrdersWidget(model: cubit.allSalesOrders[index]),
        items: cubit.allSalesOrders,
        //indicates that you do not has any other pages to fetch
        allCaught: state is SalesOrdersListAllCaughtState,
        //indicates that you we currently fetching the next page
        isLoading: state is GetSalesOrdersListPaginationLoadingState,
        mainLoading: state is GetSalesOrdersListLoadingState,
        isError: state is GetSalesOrdersListErrorState, error: getError(),
      );
    });
  }
}
