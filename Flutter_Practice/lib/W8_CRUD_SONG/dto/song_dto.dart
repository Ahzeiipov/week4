import '../model/song.dart';

class SongDto {
  static Song fromJson(String id, Map<String, dynamic> json) {
    return Song(
      id: id,
      title: json['name'],
      like: json['likes'],
    );
  }

  static Map<String, dynamic> toJson(Song song) {
    return {
      'name': song.title,
      'likes': song.like,
    };
  }
}
