import 'package:flutter/cupertino.dart';

class DefaultListView extends StatelessWidget {
  const DefaultListView(
      {super.key,
      required this.itemBuilder,
      required this.count,
      this.physics,
      this.scrollDirection = Axis.vertical,
      this.space = 16,
      this.height});
  final Widget? Function(BuildContext, int) itemBuilder;
  final int count;
  final ScrollPhysics? physics;
  final double space;
  final Axis scrollDirection;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
          physics: physics ?? const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: scrollDirection,
          itemBuilder: itemBuilder,
          separatorBuilder: (context, index) => SizedBox(
                height: scrollDirection == Axis.horizontal ? 0 : space,
                width: scrollDirection == Axis.horizontal ? space : 0,
              ),
          itemCount: count),
    );
  }
}
