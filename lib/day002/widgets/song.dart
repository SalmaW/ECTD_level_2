import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class SongW extends StatefulWidget {
  final Audio audio;

  const SongW({required this.audio, super.key});

  @override
  State<SongW> createState() => _SongWState();
}

class _SongWState extends State<SongW> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  int currentPosition = 0;
  late bool isTriggered;

  @override
  void initState() {
    initPlayer();
    assetsAudioPlayer.open(
      widget.audio,
      autoStart: false,
    );
    isTriggered = false;
    super.initState();
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  void initPlayer() async {
    assetsAudioPlayer.currentPosition.listen((event) {
      currentPosition = event.inSeconds;
    });
    assetsAudioPlayer.isPlaying.listen((triggered) {
      isTriggered = triggered;
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Center(
          child: Text(
            "${widget.audio.metas.title?.split(" ").first[0].toUpperCase()}${widget.audio.metas.artist?.split(" ").last[0].toUpperCase()}",
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
      trailing: StreamBuilder(
        stream: assetsAudioPlayer.realtimePlayingInfos,
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshots.data == null) {
            return const SizedBox.shrink();
          }
          return Text(
            convertSeconds(isTriggered
                ? currentPosition
                : snapshots.data?.duration.inSeconds ?? 0),
            style: const TextStyle(fontSize: 24),
          );
        },
      ),
      title: Text(widget.audio.metas.title ?? "NO title"),
      subtitle: Text(widget.audio.metas.artist ?? "NO name"),
      onTap: () async {
        await assetsAudioPlayer.playOrPause();
        if (isTriggered) {
          isTriggered = !assetsAudioPlayer.stopped;
        }
        setState(() {});
      },
    );
  }

  String convertSeconds(int seconds) {
    String minutes = (seconds ~/ 60).toString();
    String secondsEx = (seconds % 60).toString();
    return "${minutes.padLeft(2, '0')}:${secondsEx.padLeft(2, '0')}";
  }
}
