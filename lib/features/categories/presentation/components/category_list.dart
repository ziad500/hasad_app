import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/categories/presentation/controller/cubit/categories_cubit.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.type});
  final int type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoriesCubit>()..getCategories(),
      child: Center(
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            CategoriesCubit cubit = CategoriesCubit.get(context);
            if (state is GetCategoriesLoadingState) {
              return const LoadingWidget();
            }
            if (cubit.categories.isEmpty) {
              return const Text("No Categories Found");
            }
            return DefaultListView(
                height: 110.h,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                      onTap: () => Navigator.pushNamed(context, Routes.directSellingListScreen,
                          arguments: {
                            "id": cubit.categories[index].id.toString(),
                            "name": cubit.categories[index].name.toString()
                          }),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        width: 95.w,
                        decoration: BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          children: [
                            Expanded(
                                child: _NetowrkImage(
                              image: cubit.categories[index].image,
                            )),
                            const SizedBox(
                              height: 7,
                            ),
                            DefaultText(
                              text: isEmpty(cubit.categories[index].name),
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                      ),
                    ),
                count: cubit.categories.length);
          },
        ),
      ),
    );
  }
}

class _NetowrkImage extends StatelessWidget {
  const _NetowrkImage({required this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return NetworkImageWidget(
      image: image,
      imageBuilder: (_, image) => Container(
        width: 100.w - 20.w,
        decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover),
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)),
      ),
      errorWidget: Container(
        width: 100.w - 20.w,
        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
