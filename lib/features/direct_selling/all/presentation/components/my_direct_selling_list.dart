import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/main_item.dart';
import 'package:hasad_app/core/pagenation/base_list_view.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/my_direct_selling_list/cubit/my_direct_selling_list_cubit.dart';

///pagenated list view to fetch all the reports
///the page contains 8 reports , the '_ReportsListViewState' will has a 'ScrollController' variable
///which will listen to the list if any scroll happen [in case that the current scroll position is equal to or bigger that .7 of total height
///the cubit will call the fetching method to fetch the next page , this will happen only if the current state is not loading state
///which indicates that no fetchng request is happening now]
class MyDirectSellingListView extends StatefulWidget {
  const MyDirectSellingListView({super.key});

  @override
  State<MyDirectSellingListView> createState() => _MyDirectSellingListViewState();
}

class _MyDirectSellingListViewState extends State<MyDirectSellingListView> {
  //to be attched with the listview
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MyDirectSellingListCubit>(context);

    return BlocBuilder<MyDirectSellingListCubit, MyDirectSellingListState>(
        builder: (context, state) {
      //pass the cubit ,states and items type '<MyDirectSellingListCubit, DirectSellingListDartState, ReportModel>'
      if (state is MyGetDirectSellingListErrorState) {
        return Center(child: Text(state.error));
      }
      return PagenatedListView<MyDirectSellingListCubit, MyDirectSellingListState,
          DirectSellingDataModel>(
        //start listening to fetch the next page when scroll to .7 total height
        init: () => controller.addListener(() async {
          var percentageOftotalLength = 0.7 * controller.position.maxScrollExtent;
          var currentLength = controller.position.pixels;
          if (currentLength >= percentageOftotalLength &&
              cubit.state is! MyGetDirectSellingListPaginationLoadingState) {
            await cubit.getDirectSellingList();
          }
        }),
        controller: controller,
        //build this widget for the cureent screen
        childBuilder: (index) =>
            MainItemWidget(isbidding: false, directSellingDataModel: cubit.myDirectSelling[index]),
        items: cubit.myDirectSelling,
        //indicates that you do not has any other pages to fetch
        allCaught: state is MyDirectSellingListAllCaughtState,
        //indicates that you we currently fetching the next page
        isLoading: state is MyGetDirectSellingListPaginationLoadingState,
        mainLoading: state is MyGetDirectSellingListLoadingState,
      );
    });
  }
}
