import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/network_image.dart';

class CAtegoriesList extends StatelessWidget {
  const CAtegoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultListView(
        height: 110.h,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: 95.w,
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  const Expanded(child: _NetowrkImage()),
                  const SizedBox(
                    height: 7,
                  ),
                  DefaultText(
                    text: "خضار",
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
        count: 3);
  }
}

class _NetowrkImage extends StatelessWidget {
  const _NetowrkImage({super.key});

  @override
  Widget build(BuildContext context) {
    return NetworkImageWidget(
      image: null,
      imageBuilder: (_, image) => Container(
        width: 100.w - 20.w,
        decoration: BoxDecoration(
            image: DecorationImage(image: image),
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
