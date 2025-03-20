import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool isInitialized = false;
  bool hasError = false;

  final String videoUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4";

  @override
  void initState() {
    super.initState();
    // VideoPlayerController.network қолданылып, инициализация кезінде қате бақылауы жүргізіледі.
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize()
          .then((_) {
            if (_controller.value.hasError) {
              setState(() {
                hasError = true;
                isInitialized = true;
              });
            } else {
              setState(() {
                isInitialized = true;
              });
              _controller.play();
            }
          })
          .catchError((error) {
            setState(() {
              hasError = true;
              isInitialized = true;
            });
          });
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (!isInitialized) {
      content = const CircularProgressIndicator();
    } else if (hasError || _controller.value.hasError) {
      content = Padding(
        padding: const EdgeInsets.all(15),
        child: const Text(
          "Видео қазір қолжетімсіз, тікелей эфир емес",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      content = AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Video Live"), backgroundColor: Colors.black, foregroundColor: Colors.yellow),
      body: Center(child: content),
      floatingActionButton:
          (hasError || _controller.value.hasError)
              ? null
              : FloatingActionButton(
                backgroundColor: Colors.yellow,
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                  });
                },
                child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.black),
              ),
    );
  }
}
