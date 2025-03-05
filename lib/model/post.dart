class Post {
  final String author;
  final String imageUrl;
  final String title;
  final String description;
  final int likes;
  final int comments;
  final int shares;

  Post({
    this.author = "",
    required this.imageUrl,
    required this.title,
    required this.description,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });
}
