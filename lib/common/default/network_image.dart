import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/image_view.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget(
      {super.key,
      required this.image,
      this.radius,
      this.imageBuilder,
      this.placeholder,
      this.errorWidget,
      this.enableOnTap = false,
      this.putUrl = true});
  final String? image;
  final double? radius;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget? errorWidget;
  final bool enableOnTap;
  final bool putUrl;

  @override
  Widget build(BuildContext context) {
    return (image == null || image!.contains("null") || image == "")
        ? errorWidget ?? CircleAvatar(radius: radius ?? 20.w, child: const Icon(Icons.error))
        : CachedNetworkImage(
            key: UniqueKey(),
            imageUrl: image!,
            fit: BoxFit.fill,
            imageBuilder: imageBuilder ??
                (context, imageProvider) => InkWell(
                      onTap: !enableOnTap
                          ? null
                          : () => navigatorToImagesView(
                              context: context, images: [image!], index: 0, putUrl: putUrl),
                      child: Image(
                        image: imageProvider,
                        width: radius,
                        fit: BoxFit.fill,
                      ),
                    ),
            filterQuality: FilterQuality.medium,
            placeholder: placeholder ??
                (context, url) => CircleAvatar(
                    radius: radius ?? 20.w,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    )),
            errorWidget: (context, url, error) =>
                errorWidget ?? CircleAvatar(radius: radius ?? 20.w, child: const Icon(Icons.error)),
            cacheKey: image,
          );
  }
}
