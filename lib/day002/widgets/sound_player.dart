import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class SoundPlayer extends StatefulWidget {
  final Playlist playlist;

  const SoundPlayer({required this.playlist, super.key});

  @override
  State<SoundPlayer> createState() => _SoundPlayerState();
}

class _SoundPlayerState extends State<SoundPlayer> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  int currentPosition = 0;
  double currentVolume = 1.0;
  double currentSpeed = 1.0;

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  void initPlayer() async {
    await assetsAudioPlayer.open(
      // volume: currentVolume,
      autoStart: false,
      widget.playlist,
      loopMode: LoopMode.playlist,
    );

    assetsAudioPlayer.currentPosition.listen((event) {
      currentPosition = event.inSeconds;
    });
    assetsAudioPlayer.volume.listen((event) {
      // print(">>>>>>>>>${event}");
      currentVolume = event;
    });
    assetsAudioPlayer.playSpeed.listen((event) {
      currentSpeed = event;
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
                                icon: const Icon(
                                  Icons.skip_previous,
                                  size: 35,
                                )),
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
                                icon: const Icon(
                                  Icons.skip_next,
                                  size: 35,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SegmentedButton(
                                  selected: {currentSpeed},
                                  onSelectionChanged: (values) {
                                    changeSpeed(values);
                                  },
                                  segments: const [
                                    ButtonSegment(
                                      value: 1,
                                      icon: Text("1x"),
                                    ),
                                    ButtonSegment(
                                      value: 6,
                                      icon: Text("2x"),
                                    ),
                                    ButtonSegment(
                                      value: 12,
                                      icon: Text("3x"),
                                    ),
                                    ButtonSegment(
                                      value: 16,
                                      icon: Text("4x"),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SegmentedButton(
                                  selected: {currentVolume},
                                  onSelectionChanged: (values) {
                                    changeVolume(values);
                                  },
                                  segments: const [
                                    ButtonSegment(
                                      value: 1,
                                      icon: Icon(Icons.volume_up),
                                    ),
                                    ButtonSegment(
                                      value: 0.5,
                                      icon: Icon(Icons.volume_down),
                                    ),
                                    ButtonSegment(
                                      value: 0,
                                      icon: Icon(Icons.volume_mute),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Slider(
                        value: currentPosition.toDouble(),
                        max: snapShots.data?.duration.inSeconds.toDouble() ?? 0,
                        min: 0,
                        onChanged: (value) {
                          setState(() {
                            currentPosition = value.toInt();
                          });
                        },
                        onChangeEnd: (value) {
                          assetsAudioPlayer
                              .seek(Duration(seconds: value.toInt()));
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${convertSeconds(currentPosition)}  /  ${convertSeconds(snapShots.data?.duration.inSeconds ?? 0)}",
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
    );
  }

  void changeSpeed(Set<num> values) {
    currentSpeed = values.first.toDouble();
    assetsAudioPlayer.setPlaySpeed(currentSpeed);
    setState(() {});
  }

  void changeVolume(Set<num> values) {
    currentVolume = values.first.toDouble();
    assetsAudioPlayer.setVolume(currentVolume);
    setState(() {});
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
