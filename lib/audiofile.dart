import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  final String audioPath;
  const AudioFile({Key? key, required this.advancedPlayer, required this.audioPath}) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {

  Duration _duration =  const Duration();
  Duration _position =  const Duration();
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  Color color = Colors.deepOrangeAccent.shade200.withOpacity(0.7);
  final List<IconData> _icons = [
    Icons.play_circle_fill_rounded,
    Icons.pause_circle_filled_rounded,
    Icons.fast_forward_rounded,
    Icons.fast_rewind_rounded,
    Icons.repeat_rounded,
    Icons.repeat_on_rounded,
    Icons.replay,
  ];

  @override
  void initState() {
    super.initState();

    widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
     _duration = d;
      });
    });

    widget.advancedPlayer.onPositionChanged.listen((p) {
      setState(() {
     _position = p;
      });
    });

    widget.advancedPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = const Duration(seconds: 0);
        if (isRepeat == true){
          isPlaying = true;
        } else {
        isPlaying = false;
        isRepeat = false;
        }
      });
    });
  }



  Widget playBtn(){
    return IconButton(
        padding: const EdgeInsets.only(bottom: 10),
        onPressed: () async {
          if (isPlaying == false) {
            await widget.advancedPlayer.setSourceAsset(widget.audioPath);
            await widget.advancedPlayer.resume();
            setState(() {
              isPlaying = true;
            });
          } else if (isPlaying == true){
            widget.advancedPlayer.pause();
            setState(() {
              isPlaying = false;
            });
          }
        },
        icon: isPlaying == false?
        Icon(_icons[0], size: 50, color: Colors.deepOrange.shade700,):
        Icon(_icons[1], size: 50, color: Colors.deepOrange.shade700)
    );
  }
  Widget forwardBtn(){
    return IconButton(
        padding: const EdgeInsets.only(bottom: 10),
        onPressed: () async {
          await widget.advancedPlayer.setPlaybackRate(1.5);
        },
        icon: Icon(_icons[2], size: 30, color: Colors.deepOrange,)
    );
  }
  Widget rewindBtn(){
    return IconButton(
        padding: const EdgeInsets.only(bottom: 10),
        onPressed: () async {
          await widget.advancedPlayer.setPlaybackRate(0.5);
        },
        icon: Icon(_icons[3], size: 30, color: Colors.deepOrange,)
    );
  }
  Widget replayBtn(){
    return IconButton(
        padding: const EdgeInsets.only(bottom: 10),
        onPressed: () async {
          await widget.advancedPlayer.setPlaybackRate(1);
        },
        icon: Icon(_icons[6], size: 30, color: Colors.deepOrange,)
    );
  }
  Widget repeatBtn(){
    return IconButton(
        padding: const EdgeInsets.only(bottom: 10),
        onPressed: () async{
          if (isRepeat == false) {
            await widget.advancedPlayer.setReleaseMode(ReleaseMode.loop);
            setState(() {
              isRepeat == true;
            });
          } else {
            await widget.advancedPlayer.setReleaseMode(ReleaseMode.release);
            isRepeat == false;
          }
        },
        icon: isRepeat == false?
        Icon(_icons[4], size: 30, color: Colors.deepOrange.shade700,):
        Icon(_icons[5], size: 30, color: Colors.deepOrange.shade700,)
    );
  }

  Widget slider(){
    return Slider(
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.deepOrangeAccent.shade100,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        },
    );
  }

  void changeToSecond(int second){
    Duration newDuration = Duration(seconds: second);
    widget.advancedPlayer.seek(newDuration);
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          repeatBtn(),
          rewindBtn(),
          playBtn(),
          forwardBtn(),
          replayBtn(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_position.toString().split(".")[0], style:const TextStyle(fontSize: 16)),
                Text(_duration.toString().split(".")[0], style:const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          slider(),
          loadAsset(),
        ],
      ),
    );
  }
}

