import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/main_item.dart';
import 'package:hasad_app/core/pagenation/base_list_view.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/cubit/direct_selling_list_dart_cubit.dart';

///pagenated list view to fetch all the reports
///the page contains 8 reports , the '_ReportsListViewState' will has a 'ScrollController' variable
///which will listen to the list if any scroll happen [in case that the current scroll position is equal to or bigger that .7 of total height
///the cubit will call the fetching method to fetch the next page , this will happen only if the current state is not loading state
///which indicates that no fetchng request is happening now]
class DirectSellingListView extends StatefulWidget {
  const DirectSellingListView({super.key, this.expanded = false});
  final bool expanded;

  @override
  State<DirectSellingListView> createState() => _DirectSellingListViewState();
}

class _DirectSellingListViewState extends State<DirectSellingListView> {
  //to be attched with the listview
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DirectSellingListCubit>(context);

    return BlocBuilder<DirectSellingListCubit, DirectSellingListState>(builder: (context, state) {
      //pass the cubit ,states and items type '<DirectSellingListCubit, DirectSellingListDartState, ReportModel>'

      return PagenatedListView<DirectSellingListCubit, DirectSellingListState,
          DirectSellingDataModel>(
        useExpanded: widget.expanded,
        //start listening to fetch the next page when scroll to .7 total height
        init: () => controller.addListener(() async {
          var percentageOftotalLength = 0.7 * controller.position.maxScrollExtent;
          var currentLength = controller.position.pixels;
          if (currentLength >= percentageOftotalLength &&
              cubit.state is! GetDirectSellingListPaginationLoadingState) {
            await cubit.getDirectSellingList();
          }
        }),
        controller: controller,
        //build this widget for the cureent screen
        childBuilder: (index) =>
            MainItemWidget(isbidding: false, directSellingDataModel: cubit.allDirectSelling[index]),
        items: cubit.allDirectSelling,
        //indicates that you do not has any other pages to fetch
        allCaught: state is DirectSellingListAllCaughtState,
        //indicates that you we currently fetching the next page
        isLoading: state is GetDirectSellingListPaginationLoadingState,
        mainLoading: state is GetDirectSellingListLoadingState,
      );
    });
  }
}
