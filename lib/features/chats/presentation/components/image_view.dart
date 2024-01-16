import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:url_launcher/url_launcher.dart';

class FileView extends StatelessWidget {
  const FileView({super.key, required this.file});
  final String file;

  @override
  Widget build(BuildContext context) {
    String fileExtension = getFileExtension(file);

    return isImage(file)
        ? NetworkImageWidget(
            enableOnTap: true,
            image: file,
            putUrl: false,
            errorWidget: const SizedBox(),
          )
        : InkWell(
            onTap: () => launchUrl(Uri.parse(file), mode: LaunchMode.externalApplication),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 30.w,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: Center(child: TitleWidget(title: fileExtension)),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: TitleWidget(
                    title: file,
                    maxlines: 2,
                  ))
                ],
              ),
            ),
          );
  }

  String getFileExtension(String url) {
    try {
      // Find the last occurrence of a dot in the URL
      int dotIndex = url.lastIndexOf('.');

      if (dotIndex != -1) {
        // Extract the substring that follows the last dot until the first occurrence of a question mark
        String extensionWithQueryParams = url.substring(dotIndex + 1);

        // Remove any query parameters after the extension
        String extension = extensionWithQueryParams.split('?').first;

        return extension;
      }

      return '';
    } catch (e) {
      return '';
    }
  }
}
