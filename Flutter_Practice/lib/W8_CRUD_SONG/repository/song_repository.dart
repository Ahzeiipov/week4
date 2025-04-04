import '../model/song.dart';

abstract class SongRepository {
  Future<Song> addSong({required String title, required int like});
  Future<List<Song>> getSongs();
  Future<void> updateSong({required String id, required String title, required int like});
  Future<void> deleteSong(String id);
}
