import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:ectd2/day002/widgets/song.dart';
import 'package:flutter/material.dart';

class PlayList extends StatefulWidget {
  final Playlist playlist;

  const PlayList({required this.playlist, super.key});

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PlayList"),
      ),
      body: ListView(
        children: [
          for (var audio in widget.playlist.audios) SongW(audio: audio),
        ],
      ),
    );
  }
}
