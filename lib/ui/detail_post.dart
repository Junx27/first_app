import 'package:flutter/material.dart';
import 'package:first_app/model/post.dart'; // Sesuaikan dengan path model Post

class DetailPage extends StatelessWidget {
  final Post post;

  DetailPage({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title), // Menampilkan judul di AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  20), // Adjust the radius to your preference
              child: Container(
                width: double.infinity,
                height: 200, // Ukuran gambar
                child: Image.network(
                  post.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Judul
            Text(
              post.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Deskripsi
            Text(
              post.description,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
