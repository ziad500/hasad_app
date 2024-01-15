import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/features/favorites/presentation/controller/cubit/favorites_cubit.dart';

class AddToFavLoading extends StatelessWidget {
  const AddToFavLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is AddToFavoritesListLoadingState) {
          return const LoadingPage();
        }
        return const SizedBox();
      },
    );
  }
}
