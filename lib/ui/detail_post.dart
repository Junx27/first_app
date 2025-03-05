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
  double appBarHeight = 400;
  bool _isAppBarColored = false;
  bool _isContainerVisible = false;

  final List<String> comments = [
    "Sangat menarik!",
    "Bagus sekali!",
    "Ini sangat membantu!",
    "Suka dengan penulisnya.",
    "Top banget!",
    "Bermanfaat banget, terima kasih!",
    "Keren!",
    "Informasi yang sangat baik!",
    "Ini benar-benar menginspirasi!",
    "Saya setuju dengan ini!",
    "Luar biasa, terus berkarya!",
    "Kontennya berkualitas!",
    "Sangat informatif dan jelas!",
    "Wah, ini yang saya cari!",
    "Terima kasih sudah berbagi!",
    "Penjelasannya mudah dipahami!",
    "Mantap sekali!",
    "Ini layak dibagikan ke teman-teman!",
    "Sederhana tapi sangat berguna!",
    "Tetap semangat dalam berbagi ilmu!"
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
                        Text(
                          'Komentar (${comments.length})',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
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
                      child: Text(
                        comments[index],
                        style: TextStyle(fontSize: 14, color: Colors.black),
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
