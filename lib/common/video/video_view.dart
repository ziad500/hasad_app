import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/main_layout.dart';

import 'overlay_video.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class VideoPlayerFromPath extends StatefulWidget {
  final String videoPath;

  const VideoPlayerFromPath({super.key, required this.videoPath});

  @override
  createState() => _VideoPlayerFromPathState();
}

class _VideoPlayerFromPathState extends State<VideoPlayerFromPath> {
  late VideoPlayerController _controller;
  late VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    if (widget.videoPath.startsWith('http')) {
      // Network video
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoPath));
    } else {
      // File video
      _controller = VideoPlayerController.file(
        File(widget.videoPath),
      );
    }

    _listener = () {
      setState(() {});
    };

    _controller.addListener(_listener);
    _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      back: true,
      appbaractions: [
        if (widget.videoPath.startsWith('http'))
          IconButton(
              onPressed: () {
                /*  DownloadFileService.downloadFileAsBytes(widget.videoPath)
                    .then((value) => DownloadFileService.saveFileInStorage(value, widget.videoPath))
                    .then((value) => showSnackbar(
                        context: context, state: ToastStates.SUCCESS, text: LocaleKeys.done.tr()));
               */
              },
              icon: const Icon(
                Icons.download,
                color: Colors.white,
              ))
      ],
      appbarColor: Colors.black,
      scaffoldColor: Colors.black,
      body: _controller.value.isInitialized
          ? Stack(
              children: <Widget>[
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller)),
                ),
                Positioned.fill(child: AdvancedOverlayWidget(controller: _controller)),
              ],
            )
          : const Center(child: LoadingWidget()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_listener);
    _controller.dispose();
  }
}
