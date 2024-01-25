import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

import 'network_image.dart';

class UserImage extends StatelessWidget {
  const UserImage(
      {super.key,
      required this.image,
      this.radius = 30,
      this.iconSize = 25,
      this.isEditing = false,
      this.uploadImageFunction,
      this.isFile = false});
  final String? image;
  final double radius;
  final double iconSize;
  final bool isEditing;
  final void Function()? uploadImageFunction;
  final bool isFile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
            padding: EdgeInsets.all(isEditing ? 10 : 0.0),
            child: isFile
                ? CircleAvatar(
                    radius: radius,
                    backgroundImage: Image.file(File(image!)).image,
                    backgroundColor: Colors.white,
                  )
                : NetworkImageWidget(
                    image: image,
                    radius: radius,
                    imageBuilder: (_, image) => CircleAvatar(
                      radius: radius,
                      backgroundImage: image,
                    ),
                    errorWidget: CircleAvatar(
                      radius: radius,
                      backgroundColor: AppColors.primaryColor,
                      child: SvgPicture.asset(
                        SVGManager.user,
                        height: radius,
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                    ),
                    placeholder: (context, _) => CircleAvatar(
                      radius: radius,
                      backgroundColor: AppColors.primaryColor,
                      child: const CircularProgressIndicator(
                        color: AppColors.white,
                      ),
                    ),
                  )),
        if (isEditing)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: uploadImageFunction,
              child: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ),
          )
      ],
    );
  }
}
