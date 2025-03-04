import 'package:first_app/data/post_data.dart';
import 'package:first_app/widget/post_grid.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0), child: PostList(posts: posts)),
    );
  }
}
