import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_text.dart';

class IconAndText extends StatelessWidget {
  const IconAndText(
      {super.key,
      required this.svg,
      required this.title,
      this.color,
      this.widget,
      this.maxLines,
      this.size,
      this.svgWidget});
  final String svg;
  final String title;
  final Color? color;
  final Widget? widget;
  final int? maxLines;
  final double? size;
  final Widget? svgWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (svgWidget != null) svgWidget!,
        if (svgWidget == null)
          SvgPicture.asset(svg,
              colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn)),
        const SizedBox(
          width: 8,
        ),
        widget == null
            ? Expanded(
                child: DefaultText(
                text: title,
                maxlines: maxLines,
                textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: color, fontSize: size ?? 13.sp, overflow: TextOverflow.ellipsis),
              ))
            : Expanded(
                child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultText(
                    maxlines: maxLines,
                    text: title,
                    textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: color, fontSize: size ?? 13.sp, overflow: TextOverflow.ellipsis),
                  ),
                  widget!
                ],
              ))
      ],
    );
  }
}
