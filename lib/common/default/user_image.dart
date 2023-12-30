import 'dart:io';

import 'package:flutter/material.dart';

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
