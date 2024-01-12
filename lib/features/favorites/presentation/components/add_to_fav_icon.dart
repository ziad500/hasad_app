import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/favorites/presentation/controller/cubit/favorites_cubit.dart';
import 'package:hasad_app/utils/app_assets.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.directSellingDataModel});
  final DirectSellingDataModel directSellingDataModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if (state is AddToFavoritesListErrorState) {
          showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        FavoritesCubit cubit = FavoritesCubit.get(context);
        return InkWell(
            onTap: () => cubit.addToFav(directSellingDataModel),
            child: SvgPicture.asset(
              SVGManager.favorite,
              colorFilter: ColorFilter.mode(
                  cubit.inFavList(directSellingDataModel.id.toString()) ? Colors.red : Colors.grey,
                  BlendMode.srcIn),
            ));
      },
    );
  }
}
