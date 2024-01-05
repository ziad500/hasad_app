import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_colors.dart';

enum MediaType {
  image,
  video,
}

class PickMediaWidget extends StatefulWidget {
  const PickMediaWidget(
      {super.key, this.text, required this.mediaType, required this.onUpload, this.widget});
  final String? text;
  final Function(String?) onUpload;
  final MediaType? mediaType;
  final Widget? widget;

  @override
  State<PickMediaWidget> createState() => _PickMediaWidgetState();
}

class _PickMediaWidgetState extends State<PickMediaWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showChooseModalBottomSheet(context);
      },
      child: image != null
          ? Container(
              width: double.infinity,
              height: 90.h,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: AppColors.pickImageColor,
                  image: DecorationImage(image: Image.file(File(image!.path)).image),
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(10)),
            )
          : video != null
              ? Container(
                  height: 60,
                  width: 60,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.pickImageColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: const Center(child: Icon(Icons.video_library_outlined)),
                )
              : Container(
                  height: 60,
                  width: 120,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.pickImageColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.text ?? 'upload video +',
                        style: TextStyle(fontSize: 24.sp, color: AppColors.iconColor),
                      ),
                    ),
                  ),
                ),
    );
  }

  Future showChooseModalBottomSheet(context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28))),
      builder: (context) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      if (widget.mediaType == MediaType.image) {
                        pickImage(ImageSource.gallery)
                            .then((value) => widget.onUpload(image!.path));
                      } else {
                        pickVideo(ImageSource.gallery)
                            .then((value) => widget.onUpload(video!.path));
                      }
                      Navigator.pop(context);
                    },
                    dense: true,
                    leading: const Icon(
                      Icons.image,
                      size: 25,
                    ),
                    title: DefaultText(
                      text: LocaleKeys.gallary.tr(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    onTap: () {
                      if (widget.mediaType == MediaType.image) {
                        pickImage(ImageSource.camera).then((value) => widget.onUpload(image!.path));
                      } else {
                        pickVideo(ImageSource.camera).then((value) => widget.onUpload(video!.path));
                      }
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.camera,
                      size: 25,
                    ),
                    title: DefaultText(
                      text: LocaleKeys.camera.tr(),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  XFile? image;

// Create a function to open the image picker.
  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          image = pickedFile;
        });
      }
    } catch (e) {
      showSnackbar(
          context: navigatorKey.currentContext,
          text: LocaleKeys.pleaseEnsureToAttachImages.tr(),
          state: ToastStates.WARNING);
    }
  }

  XFile? video;

// Create a function to open the video picker.
  Future<void> pickVideo(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickVideo(source: source);
      if (pickedFile != null) {
        setState(() {
          video = pickedFile;
        });
      }
    } catch (e) {
      showSnackbar(
          context: navigatorKey.currentContext,
          text: LocaleKeys.pleaseEnsureToAttachImages.tr(),
          state: ToastStates.WARNING);
    }
  }
}
