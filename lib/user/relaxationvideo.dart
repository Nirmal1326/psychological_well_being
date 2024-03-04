import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RelaxationVideoScreen extends StatefulWidget {
  @override
  _RelaxationVideoScreenState createState() => _RelaxationVideoScreenState();
}

class _RelaxationVideoScreenState extends State<RelaxationVideoScreen> {
  late PageController _pageController;
  late List<VideoPlayerController> _controllers;

  final List<String> videoUrls = [
    'images/video/video0.mp4',
    'images/video/video1.mp4',
    'images/video/video2.mp4',
    'images/video/video3.mp4',
    'images/video/video4.mp4',
    'images/video/video5.mp4',
    'images/video/video6.mp4',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _controllers =
        videoUrls.map((url) => VideoPlayerController.asset(url)).toList();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controllers.forEach((controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relaxation Videos'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _controllers.length,
        itemBuilder: (context, index) {
          return VideoPlayerScreen(controller: _controllers[index]);
        },
        onPageChanged: (index) {
          if (index == _controllers.length - 1) {
            _showLastVideoDialog(context);
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'prev',
            onPressed: () {
              if (_pageController.page! > 0) {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Icon(Icons.navigate_before),
          ),
          FloatingActionButton(
            heroTag: 'next',
            onPressed: () {
              if (_pageController.page! < _controllers.length) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }

  void _showLastVideoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Last Video'),
          content: Text('You have reached the last video.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final VideoPlayerController controller;

  VideoPlayerScreen({required this.controller});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late Future<void> _initializeVideoPlayerFuture;
  late bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayerFuture = widget.controller.initialize();
    widget.controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: widget.controller.value.aspectRatio,
                  child: VideoPlayer(widget.controller),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black54,
                ),
                child: IconButton(
                  onPressed: _togglePlayPause,
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      widget.controller.pause();
    } else {
      widget.controller.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
