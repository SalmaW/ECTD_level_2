import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:ectd2/day002/pages/play_list.dart';
import 'package:flutter/material.dart';

import '../widgets/sound_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Playlist playList = Playlist(
    audios: [
      Audio(
          metas: Metas(title: "old-car-engine", artist: 'Artist 1'),
          "assets/old-car-engine_daniel_simion.mp3"),
      Audio(
          metas: Metas(title: "flock-of-seagulls", artist: 'Artist 2'),
          "assets/flock-of-seagulls_daniel-simion.mp3"),
      Audio(
          metas: Metas(title: "sawing-wood", artist: 'Artist 3'),
          "assets/sawing-wood-daniel_simon.mp3"),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Player"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PlayList(playlist: playList))); // Navigator.
              },
              icon: const Icon(Icons.playlist_add_check_circle)),
        ],
      ),
      body: SoundPlayer(
        playlist: playList,
      ),
    );
  }
}
