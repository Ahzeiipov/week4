import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/song_provider.dart';

class SongFormPage extends StatefulWidget {
  const SongFormPage({super.key});

  @override
  State<SongFormPage> createState() => _SongFormPageState();
}

class _SongFormPageState extends State<SongFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _likeController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final songProvider = Provider.of<SongProvider>(context, listen: false);
    final selectedSong = songProvider.selectedSong;

    if (selectedSong != null) {
      _titleController.text = selectedSong.title;
      _likeController.text = selectedSong.like.toString();
    } else {
      _titleController.clear();
      _likeController.clear();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _likeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final songProvider = Provider.of<SongProvider>(context);
    final isEditing = songProvider.selectedSong != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Update Song' : 'Add Song'),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Song Information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter title' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _likeController,
                    decoration: const InputDecoration(
                      labelText: 'Likes',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null
                        ? 'Enter a valid number of likes'
                        : null,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(isEditing ? Icons.save : Icons.add,
                          color: Colors.white),
                      label: Text(
                        isEditing ? 'Update The Song' : 'Add Song',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.pink,
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final title = _titleController.text;
                          final likes = int.parse(_likeController.text);

                          if (isEditing) {
                            songProvider.updateSong(
                                songProvider.selectedSong!.id, title, likes);
                            songProvider.setSelectedSong(null);
                          } else {
                            songProvider.addSong(title, likes);
                          }

                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
