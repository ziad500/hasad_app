import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/main_item.dart';
import 'package:hasad_app/core/pagenation/base_list_view.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/my_bidding_list/cubit/my_bidding_list_cubit.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

///pagenated list view to fetch all the reports
///the page contains 8 reports , the '_ReportsListViewState' will has a 'ScrollController' variable
///which will listen to the list if any scroll happen [in case that the current scroll position is equal to or bigger that .7 of total height
///the cubit will call the fetching method to fetch the next page , this will happen only if the current state is not loading state
///which indicates that no fetchng request is happening now]
class MyBiddingListView extends StatefulWidget {
  const MyBiddingListView({super.key});

  @override
  State<MyBiddingListView> createState() => _MyBiddingListViewState();
}

class _MyBiddingListViewState extends State<MyBiddingListView> {
  //to be attched with the listview
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MyBiddingListCubit>(context);

    return BlocBuilder<MyBiddingListCubit, MyBiddingListState>(builder: (context, state) {
      //pass the cubit ,states and items type '<MyBiddingListCubit, BiddingListDartState, ReportModel>'
      if (state is MyGetBiddingListErrorState) {
        return Center(child: Text(state.error));
      }
      return PagenatedListView<MyBiddingListCubit, MyBiddingListState, DirectSellingDataModel>(
        //start listening to fetch the next page when scroll to .7 total height
        init: () => controller.addListener(() async {
          var percentageOftotalLength = 0.7 * controller.position.maxScrollExtent;
          var currentLength = controller.position.pixels;
          if (currentLength >= percentageOftotalLength &&
              cubit.state is! MyGetBiddingListPaginationLoadingState) {
            await cubit.getBiddingList();
          }
        }),
        controller: controller,
        //build this widget for the cureent screen
        childBuilder: (index) =>
            MainItemWidget(isbidding: true, directSellingDataModel: cubit.myBidding[index]),
        items: cubit.myBidding,
        //indicates that you do not has any other pages to fetch
        allCaught: state is MyBiddingListAllCaughtState,
        //indicates that you we currently fetching the next page
        isLoading: state is MyGetBiddingListPaginationLoadingState,
        mainLoading: state is MyGetBiddingListLoadingState,
      );
    });
  }
}
