import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/main_item.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/favorites/presentation/controller/cubit/favorites_cubit.dart';

class DirectSellingFavListView extends StatelessWidget {
  const DirectSellingFavListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        FavoritesCubit cubit = FavoritesCubit.get(context);
        List<DirectSellingDataModel> list =
            cubit.allFavorites.where((element) => element.biddingDate != null).toList();
        if (state is GetFavoritesListLoadingState) {
          return const LoadingWidget();
        }
        if (state is GetFavoritesListErrorState) {
          return Center(child: DefaultText(text: state.error));
        }
        return DefaultListView(
            itemBuilder: (context, index) =>
                MainItemWidget(isbidding: true, directSellingDataModel: list[index]),
            count: list.length);
      },
    );
  }
}
