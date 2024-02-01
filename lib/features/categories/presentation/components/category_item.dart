import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/features/categories/domain/models/categories_model.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class CategoriMainItem extends StatelessWidget {
  const CategoriMainItem({super.key, required this.type, required this.categoryListModel});
  final int type;
  final CategoryListModel categoryListModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => type == 1
          ? Navigator.pushNamed(context, Routes.directSellingListScreen, arguments: {
              "id": categoryListModel.id.toString(),
              "name": categoryListModel.name.toString()
            })
          : Navigator.pushNamed(context, Routes.biddingListScreen, arguments: {
              "id": categoryListModel.id.toString(),
              "name": categoryListModel.name.toString()
            }),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 95.w,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: _NetowrkImage(
                  image: categoryListModel.image,
                )),
            const SizedBox(
              height: 7,
            ),
            DefaultText(
              text: isEmpty(categoryListModel.name),
              maxlines: 1,
              textStyle: Theme.of(context).textTheme.bodySmall,
            )
          ],
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
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover),
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)),
      ),
      errorWidget: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
