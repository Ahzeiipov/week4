import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/song_dto.dart';
import '../model/song.dart';
import 'song_repository.dart';

class FirebaseSongRepository extends SongRepository {
  static const String baseUrl =
      'https://song-a1c8d-default-rtdb.asia-southeast1.firebasedatabase.app/';
  static const String songsCollection = "songs";

  String get allSongsUrl => '$baseUrl/$songsCollection.json';

  @override
  Future<Song> addSong({required String title, required int like}) async {
    final uri = Uri.parse(allSongsUrl);
    final newSongData = {'name': title, 'likes': like};

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(newSongData),
    );

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to add song');
    }

    final newId = json.decode(response.body)['name'];
    return Song(id: newId, title: title, like: like);
  }

  @override
  Future<void> deleteSong(String id) async {
    final uri = Uri.parse('$baseUrl/$songsCollection/$id.json');

    final response = await http.delete(uri);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to delete song');
    }
  }

  @override
  Future<List<Song>> getSongs() async {
    final uri = Uri.parse(allSongsUrl);
    final response = await http.get(uri);

    if (response.statusCode != HttpStatus.ok &&
        response.statusCode != HttpStatus.created) {
      throw Exception('Failed to load songs');
    }

    final data = json.decode(response.body) as Map<String, dynamic>?;

    if (data == null) return [];

    return data.entries
        .map((entry) => SongDto.fromJson(entry.key, entry.value))
        .toList();
  }

  @override
  Future<void> updateSong(
      {required String id, required String title, required int like}) async {
    final uri = Uri.parse('$baseUrl/$songsCollection/$id.json');
    final updateData = {'name': title, 'likes': like};

    final response = await http.put(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updateData),
    );

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to update song');
    }
  }
}
