import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  void initPlayer() async {
    await assetsAudioPlayer.open(
        autoStart: false,
        loopMode: LoopMode.playlist,
        Playlist(
          audios: [
            Audio(
                metas: Metas(title: "old-car-engine"),
                "assets/old-car-engine_daniel_simion.mp3"),
            Audio(
                metas: Metas(title: "flock-of-seagulls"),
                "assets/flock-of-seagulls_daniel-simion.mp3"),
            Audio(
                metas: Metas(title: "sawing-wood"),
                "assets/sawing-wood-daniel_simon.mp3"),
          ],
        ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Player"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: assetsAudioPlayer.realtimePlayingInfos,
          builder: (context, snapShots) {
            if (snapShots.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          assetsAudioPlayer.getCurrentAudioTitle == ''
                              ? "Song's name"
                              : assetsAudioPlayer.getCurrentAudioTitle,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: snapShots.data?.current?.index == 0
                                      ? null
                                      : () {
                                          assetsAudioPlayer.previous();
                                        },
                                  icon: const Icon(Icons.skip_previous)),
                              getButtonWidget,
                              IconButton(
                                  onPressed: snapShots.data?.current?.index ==
                                          assetsAudioPlayer
                                                  .playlist!.audios.length -
                                              1
                                      ? null
                                      : () {
                                          assetsAudioPlayer.next();
                                        },
                                  icon: const Icon(Icons.skip_next)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Slider(
                          value: snapShots.data?.currentPosition.inSeconds
                                  .toDouble() ??
                              0.0,
                          max: snapShots.data?.duration.inSeconds.toDouble() ??
                              0,
                          min: 0,
                          onChanged: (value) {
                            assetsAudioPlayer
                                .seek(Duration(seconds: value.toInt()));
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${convertSeconds(snapShots.data?.currentPosition.inSeconds ?? 0)}  /  ${convertSeconds(snapShots.data?.duration.inSeconds ?? 0)}",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget get getButtonWidget =>
      assetsAudioPlayer.builderIsPlaying(builder: (context, isPlaying) {
        return FloatingActionButton.large(
          backgroundColor: Colors.green.shade200,
          onPressed: () async {
            if (isPlaying) {
              assetsAudioPlayer.pause();
            } else {
              assetsAudioPlayer.play();
            }
            setState(() {});
          },
          shape: const CircleBorder(),
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow_rounded,
            size: 80,
            color: Colors.white,
          ),
        );
      });

  String convertSeconds(int seconds) {
    String minutes = (seconds ~/ 60).toString();
    String secondsEx = (seconds % 60).toString();
    return "${minutes.padLeft(2, '0')}:${secondsEx.padLeft(2, '0')}";
  }
}
