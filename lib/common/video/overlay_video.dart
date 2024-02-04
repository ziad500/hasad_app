import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/app_colors.dart';

class AdvancedOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const AdvancedOverlayWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  String getPosition() {
    final duration = Duration(milliseconds: controller.value.position.inMilliseconds.round());

    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => controller.value.isPlaying ? controller.pause() : controller.play(),
        child: Stack(
          children: <Widget>[
            buildPlay(),
            Positioned(
              left: 8,
              bottom: 28,
              child: Text(getPosition()),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(child: buildIndicator()),
                    ],
                  ),
                )),
          ],
        ),
      );

  Widget buildIndicator() => Container(
        margin: const EdgeInsets.all(8).copyWith(right: 0),
        height: 16,
        child: VideoProgressIndicator(
          controller,
          allowScrubbing: true,
          colors: const VideoProgressColors(
              backgroundColor: Colors.grey, playedColor: AppColors.iconColor),
        ),
      );

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          color: Colors.black26,
          child: const Center(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 70,
            ),
          ),
        );
}
