import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultGridView extends StatelessWidget {
  const DefaultGridView({super.key, required this.length, required this.childBuilder});
  final int length;
  final Widget Function(int index) childBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2.h),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1,
      ),
      itemCount: length,
      itemBuilder: (context, index) {
        return childBuilder(index);
      },
    );
  }
}
