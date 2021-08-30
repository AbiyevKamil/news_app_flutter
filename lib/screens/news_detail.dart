import 'package:flutter/material.dart';
import 'package:news_app/models/news_data.dart';

class NewsDetail extends StatelessWidget {
  final NewsData content;
  NewsDetail({required this.content});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.amber,
        ),
        backgroundColor: Colors.grey[900],
        title: Text(
          'News Detail - ${content.name}',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[900],
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Container(
            child: Column(
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(content.urlToImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Author: ${content.author}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Published at: ${content.publishedAt}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Divider(
                  height: 25.0,
                  color: Colors.amber,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    content.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    content.description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


  // const NewsDetail({this.content}) : super(key: content);

