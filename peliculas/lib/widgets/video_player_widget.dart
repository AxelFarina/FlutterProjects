import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoId;

  const VideoPlayerWidget({Key? key, required this.videoId}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late final YoutubePlayerController controller;

  @override
  void initState() {
    controller = YoutubePlayerController(
        initialVideoId: widget.videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          enableCaption: false,
        ));
  }

  @override
  Widget build(BuildContext context) => buildVideo();

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        onReady: () {
          print('Player is ready.');
        },
        onEnded: (video) {
          controller.seekTo(Duration(milliseconds: 0));
          controller.pause();
        },
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
