import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/song_provider.dart';
import 'song_form.dart';

class SongList extends StatelessWidget {
  const SongList({super.key});

  @override
  Widget build(BuildContext context) {
    final songProvider = Provider.of<SongProvider>(context);

    if (songProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (songProvider.hasData) {
      final songs = songProvider.songsState!.data!;

      if (songs.isEmpty) {
        return const Center(
            child: Text("No songs yet", style: TextStyle(fontSize: 18)));
      } else {
        return ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            final song = songs[index];

            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              title: Text(
                song.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: Text("Likes: ${song.like}",
                  style: const TextStyle(color: Colors.grey)),
              onTap: () {
                songProvider.setSelectedSong(song);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SongFormPage()),
                );
              },
              trailing: IconButton(
                icon:
                    const Icon(Icons.remove_circle_outline, color: Colors.red),
                onPressed: () {
                  songProvider.deleteSong(song.id);
                },
              ),
            );
          },
        );
      }
    } else {
      return const Center(child: Text('Error loading songs'));
    }
  }
}
