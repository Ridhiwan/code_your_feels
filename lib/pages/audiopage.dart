import 'package:daybyday/audioprovider/audiofile.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPage extends StatefulWidget {
  final List jsonData;
  final int index;
  const AudioPage({Key? key, required this.index, required this.jsonData}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  AudioPlayer advancedPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    advancedPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.deepOrange.shade100,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight/3,
            child: Container(
              color: Colors.deepOrange.shade700,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search_rounded, ),
                  onPressed: () {},
                )
              ],
              backgroundColor: Colors.deepOrange.shade700,
              elevation: 0.0,
            ),
          ),
          Positioned(
            top: screenHeight*0.2,
            left: 0,
            right: 0,
            height: screenHeight*0.38,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight*0.12,),
                  Text(widget.jsonData[widget.index]["title"],
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Text(widget.jsonData[widget.index]["text"],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                  Expanded(
                      child: AudioFile(
                        advancedPlayer: advancedPlayer, audioPath: widget.jsonData[widget.index]["audio"],
                      )
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: screenHeight*0.12,
              left: (screenWidth-150)/2,
              right: (screenWidth-150)/2,
              height: screenHeight*0.18,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.deepOrange.shade200,
                    width: 2,
                  ),
                  color: Colors.deepOrange.shade300.withOpacity(0.6)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                        image: DecorationImage(
                          image: AssetImage(widget.jsonData[widget.index]["img"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                  ),
                )

                ),
              )
        ],
      )
    );
  }
}
