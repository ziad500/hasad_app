import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/core/pagenation/base_list_view.dart';
import 'package:hasad_app/features/bidding_requests/domain/models/model.dart';
import 'package:hasad_app/features/bidding_requests/presentation/components/bidding_requests_widget.dart';
import 'package:hasad_app/features/bidding_requests/presentation/controller/bidding_requests_cubit.dart';

///pagenated list view to fetch all the reports
///the page contains 8 reports , the '_ReportsListViewState' will has a 'ScrollController' variable
///which will listen to the list if any scroll happen [in case that the current scroll position is equal to or bigger that .7 of total height
///the cubit will call the fetching method to fetch the next page , this will happen only if the current state is not loading state
///which indicates that no fetchng request is happening now]
class BiddingRequestsListView extends StatefulWidget {
  const BiddingRequestsListView({super.key, this.expanded = false, required this.advertismentId});
  final bool expanded;
  final String? advertismentId;

  @override
  State<BiddingRequestsListView> createState() => _BiddingRequestsListViewState();
}

class _BiddingRequestsListViewState extends State<BiddingRequestsListView> {
  //to be attched with the listview
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<BiddingRequestsCubit>(context);

    return BlocConsumer<BiddingRequestsCubit, BiddingRequestsState>(listener: (context, state) {
      if (state is GetAcceptOrRejectErrorState) {
        showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
      }
    }, builder: (context, state) {
      //pass the cubit ,states and items type '<BiddingRequestsCubit, BiddingRequestsListDartState, ReportModel>'
      String? getError() {
        if (state is GetBiddingRequestsListErrorState) {
          return state.error;
        }
        return null;
      }

      return PagenatedListView<BiddingRequestsCubit, BiddingRequestsState,
          BiddingRequestsDataModel>(
        useExpanded: widget.expanded,
        //start listening to fetch the next page when scroll to .7 total height
        init: () => controller.addListener(() async {
          var percentageOftotalLength = 0.7 * controller.position.maxScrollExtent;
          var currentLength = controller.position.pixels;
          if (currentLength >= percentageOftotalLength &&
              cubit.state is! GetBiddingRequestsListPaginationLoadingState) {
            await cubit.getBiddingRequestsList(widget.advertismentId);
          }
        }),
        controller: controller,
        //build this widget for the cureent screen
        childBuilder: (index) => BiddingRequestsWidget(model: cubit.allBiddingRequests[index]),
        items: cubit.allBiddingRequests,
        //indicates that you do not has any other pages to fetch
        allCaught: state is BiddingRequestsListAllCaughtState,
        //indicates that you we currently fetching the next page
        isLoading: state is GetBiddingRequestsListPaginationLoadingState,
        mainLoading:
            state is GetBiddingRequestsListLoadingState || state is GetAcceptOrRejectLoadingState,
        isError: state is GetBiddingRequestsListErrorState, error: getError(),
      );
    });
  }
}
