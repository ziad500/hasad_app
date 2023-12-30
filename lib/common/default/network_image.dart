import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget(
      {super.key,
      required this.image,
      this.radius,
      this.imageBuilder,
      this.placeholder,
      this.errorWidget});
  final String? image;
  final double? radius;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return (image == null || image!.contains("null") || image == "")
        ? errorWidget ?? CircleAvatar(radius: radius ?? 20.w, child: const Icon(Icons.error))
        : CachedNetworkImage(
            key: UniqueKey(),
            imageUrl: image!,
            fit: BoxFit.fill,
            imageBuilder: imageBuilder ??
                (context, imageProvider) => Image(
                      image: imageProvider,
                      width: radius,
                      fit: BoxFit.fill,
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
