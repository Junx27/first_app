import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:first_app/model/post.dart';

class DetailPage extends StatefulWidget {
  final Post post;

  DetailPage({required this.post});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController _scrollController;
  double appBarHeight = 600;
  bool _isAppBarColored = false;
  bool _isContainerVisible = false;

  final List<Map<String, String>> comments = [
    {"author": "Junx", "text": "Sangat menarik!"},
    {"author": "Bekti", "text": "Sangat menarik!"},
    {"author": "Chibay", "text": "Sangat menarik!"},
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _isAppBarColored = _scrollController.offset > 300;
          _isContainerVisible = _scrollController.offset > 200;
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: _isAppBarColored ? Colors.deepOrange : Colors.deepOrange,
      statusBarIconBrightness:
          _isAppBarColored ? Brightness.light : Brightness.dark,
    ));

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: appBarHeight,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    double height = constraints.biggest.height;
                    height = height < 200 ? 200 : height;

                    return FlexibleSpaceBar(
                      background: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Image.network(
                          widget.post.imageUrl,
                          fit: BoxFit.cover,
                          height: height,
                        ),
                      ),
                    );
                  },
                ),
                pinned: true,
                floating: false,
                backgroundColor:
                    _isAppBarColored ? Colors.deepOrangeAccent : Colors.white,
                iconTheme: IconThemeData(
                  color: _isAppBarColored ? Colors.white : Colors.black,
                ),
                elevation: 0,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '@${widget.post.author}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.post.description,
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        SizedBox(height: 30),

                        // Action icons: Like, Comment, Share
                        ActionIcons(
                          likes: widget.post.likes,
                          comments: widget.post.comments,
                          shares: widget.post.shares,
                          onLike: () {},
                          onComment: () {},
                          onShare: () {},
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Komentar (${comments.length})',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comments[index]["author"] ?? "Anonim",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          Text(
                            comments[index]["text"] ?? "",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: comments.length,
                ),
              ),
            ],
          ),
          // Container positioned at the top when scrolled
          if (_isContainerVisible)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                height: 130,
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Row(
                              children: [
                                Icon(
                                  Icons.chevron_left,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Kembali',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ActionIcons extends StatelessWidget {
  final int likes;
  final int comments;
  final int shares;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;

  const ActionIcons({
    Key? key,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.onLike,
    required this.onComment,
    required this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildIcon(Icons.thumb_up, likes, onLike),
        SizedBox(width: 15),
        _buildIcon(Icons.comment, comments, onComment),
        SizedBox(width: 15),
        _buildIcon(Icons.share, shares, onShare),
      ],
    );
  }

  Widget _buildIcon(IconData icon, int count, VoidCallback onPressed) {
    return Row(
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.black),
          onPressed: onPressed,
        ),
        Text(
          count.toString(),
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
