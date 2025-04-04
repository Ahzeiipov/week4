import 'package:flutter/material.dart';
import '../async_value.dart';
import '../model/song.dart';
import '../repository/song_repository.dart';

class SongProvider extends ChangeNotifier {
  final SongRepository _repository;
  AsyncValue<List<Song>>? songsState;
  Song? selectedSong;

  SongProvider(this._repository) {
    fetchSongs();
  }

  bool get isLoading =>
      songsState != null && songsState!.state == AsyncValueState.loading;

  bool get hasData =>
      songsState != null && songsState!.state == AsyncValueState.success;

  void fetchSongs() async {
    try {
      songsState = AsyncValue.loading();
      notifyListeners();

      final songs = await _repository.getSongs();
      songsState = AsyncValue.success(songs);
    } catch (error) {
      songsState = AsyncValue.error(error);
    }
    notifyListeners();
  }

  void addSong(String title, int like) async {
    await _repository.addSong(title: title, like: like);
    fetchSongs();
  }

  void deleteSong(String id) async {
    await _repository.deleteSong(id);
    fetchSongs();
  }

  void updateSong(String id, String title, int like) async {
    await _repository.updateSong(id: id, title: title, like: like);
    fetchSongs();
  }

  void setSelectedSong(Song? song) {
    selectedSong = song;
    notifyListeners();
  }
}
