import 'dart:io';
import '../../core/constants.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.images, required this.index, this.isFile = false});
  final List<String> images;
  final int index;
  final bool isFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            if (images[index].startsWith('http'))
              IconButton(
                  onPressed: () {
                    /*    DownloadFileService.downloadFileAsBytes(images[index])
                        .then(
                            (value) => DownloadFileService.saveFileInStorage(value, images[index]))
                        .then((value) => showSnackbar(
                            context: context,
                            state: ToastStates.SUCCESS,
                            text: LocaleKeys.done.tr)); */
                  },
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                  ))
          ],
          backgroundColor: Colors.black,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: PageView(
            controller: PageController(initialPage: index),
            children: images
                .map(
                  (e) => Center(
                    child: isFile ? Image.file(File(e)) : Image.network(Constants.imagesUrl + e),
                  ),
                )
                .toList()));
  }
}

navigatorToImagesView(
        {required BuildContext context,
        required List<String> images,
        required int index,
        bool isFile = false}) =>
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => ImageView(images: images, index: index, isFile: isFile)));
