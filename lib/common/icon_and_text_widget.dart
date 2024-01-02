import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_text.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({super.key, required this.svg, required this.title, this.color, this.widget});
  final String svg;
  final String title;
  final Color? color;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(svg,
            colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn)),
        const SizedBox(
          width: 8,
        ),
        widget == null
            ? Expanded(
                child: DefaultText(
                text: title,
                textStyle:
                    Theme.of(context).textTheme.bodySmall?.copyWith(color: color, fontSize: 13.sp),
              ))
            : Expanded(
                child: Row(
                children: [
                  DefaultText(
                    text: title,
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: color, fontSize: 13.sp),
                  ),
                  widget!
                ],
              ))
      ],
    );
  }
}
