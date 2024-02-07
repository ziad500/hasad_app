import 'dart:io';

import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

import 'package:easy_localization/easy_localization.dart';

import '../main.dart';

import '../utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PickImagesWidget extends StatefulWidget {
  const PickImagesWidget(
      {Key? key, this.text, required this.onUpload, this.imagesStatic, required this.onRemove})
      : super(key: key);

  final String? text;
  final Function(List<String>) onUpload;
  final Function(String) onRemove;
  final List<String>? imagesStatic;

  @override
  State<PickImagesWidget> createState() => _PickImagesWidgetState();
}

class _PickImagesWidgetState extends State<PickImagesWidget> {
  List<String> images = [];
  @override
  void initState() {
    if (widget.imagesStatic != null) {
      images = widget.imagesStatic!.map((e) => e).toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        if (images.length < 3)
          InkWell(
            onTap: () {
              showChooseModalBottomSheet(context);
            },
            child: Container(
              height: 60,
              width: 60,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.pickImageColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Center(
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 24.sp, color: AppColors.iconColor),
                ),
              ),
            ),
          ),
        ...images
            .asMap()
            .entries
            .map(
              (entry) => buildImageContainer(entry.key, entry.value),
            )
            .toList(),
      ],
    );
  }

  Widget buildImageContainer(int index, String image) {
    return Stack(
      children: [
        Container(
          height: 60,
          width: 60,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: AppColors.pickImageColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: isNetworkImage(image)
              ? Image.network(
                  image,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  File(image),
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
          /* Image.file(
            File(image),
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ), */
        ),
        Positioned(
          top: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              widget.onRemove(images[index]);
              removeImage(index);
              widget.onUpload(images);
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future showChooseModalBottomSheet(context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
      ),
      builder: (context) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      pickImage(ImageSource.gallery).then((value) => widget.onUpload(images));
                      Navigator.pop(context);
                    },
                    dense: true,
                    leading: const Icon(
                      Icons.image,
                      size: 25,
                    ),
                    title: Text(LocaleKeys.gallary.tr()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    onTap: () {
                      pickImage(ImageSource.camera).then((value) => widget.onUpload(images));
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.camera,
                      size: 25,
                    ),
                    title: Text(LocaleKeys.camera.tr()),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      if (source == ImageSource.gallery) {
        final pickedFile = await ImagePicker().pickImage(source: source);
        if (pickedFile != null) {
          setState(() {
            images.add(pickedFile.path);
          });
        }
      } else {
        final pickedFile = await ImagePicker().pickImage(source: source);
        if (pickedFile != null) {
          setState(() {
            images.add(pickedFile.path);
          });
        }
      }
    } catch (e) {
      showSnackbar(
          context: navigatorKey.currentContext,
          text: LocaleKeys.pleaseEnsureToAttachImages.tr(),
          state: ToastStates.WARNING);
    }
  }

  void removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }
}

bool isNetworkImage(String path) {
  return path.startsWith('http') || path.startsWith('https');
}
