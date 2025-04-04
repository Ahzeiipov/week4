import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repository/firebase_Song_repository.dart';
import 'repository/song_repository.dart';
import 'provider/song_provider.dart';
import 'widgets/song_form.dart';
import 'widgets/song_list.dart';

void main() {
  final SongRepository songRepository = FirebaseSongRepository();

  runApp(
    MyApp(repository: songRepository),
  );
}

class MyApp extends StatelessWidget {
  final SongRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SongProvider(repository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Song CRUD App',
        theme: ThemeData(primarySwatch: Colors.pink),
        home: const SongHomePage(),
      ),
    );
  }
}

class SongHomePage extends StatelessWidget {
  const SongHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Songs', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SongFormPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: const SongList(),
    );
  }
}
