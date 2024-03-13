import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  int currentIndex = 1;

  void playSong(int soundNumber) {
    audioPlayer.play(AssetSource('song$soundNumber.mp3'));
  }

  PlayerState playerState = PlayerState.stopped;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        playerState = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/song.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  onPressed: () {
                    if (currentIndex > 0) {
                      currentIndex--;
                      playSong(currentIndex);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(playerState == PlayerState.playing
                      ? Icons.pause
                      : Icons.play_arrow),
                  onPressed: () {
                    if (playerState == PlayerState.playing) {
                      audioPlayer.pause();
                    } else {
                      audioPlayer.resume();
                      playSong(currentIndex);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  onPressed: () {
                    if (currentIndex < 6) {
                      currentIndex++;
                      playSong(currentIndex);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
