import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultRatingWidget extends StatelessWidget {
  const DefaultRatingWidget(
      {super.key,
      this.onRatingUpdate,
      this.viewOnly = false,
      this.initialRate,
      this.height,
      this.width,
      this.unratedColor});
  final void Function(double)? onRatingUpdate;
  final bool viewOnly;
  final double? initialRate;
  final double? height;
  final double? width;
  final Color? unratedColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20.h,
      width: width ?? 100.w,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: RatingBar.builder(
          ignoreGestures: viewOnly,
          initialRating: initialRate ?? 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          unratedColor: unratedColor,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: onRatingUpdate ?? (rating) {},
        ),
      ),
    );
  }
}
