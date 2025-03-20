import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repository/http_posts_repository.dart';
import 'ui/providers/post_provider.dart';
import 'ui/screens/post_screen.dart';

void main() {
  // 1- Create the repository
  // PostRepository postRepo = MockPostRepository();
  // HttpPostsRepository postRepo = HttpPostsRepository();

  // 2 - Run the UI
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(repository: HttpPostsRepository()),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
    ),
  );
}
