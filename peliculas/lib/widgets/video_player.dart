import 'package:flutter/material.dart';
import 'package:peliculas/widgets/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
    final video = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
    late VideoPlayerController controller;


    @override
  void initState() {
      super.initState();
      controller = VideoPlayerController.network(video)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => controller.play());
  }

    @override
  void dispose() {
      controller.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(videoId: video,);
  }
}