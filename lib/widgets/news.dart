import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_data.dart';
import 'package:news_app/screens/news_detail.dart';

Widget newsItem(NewsData content, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsDetail(
                    content: content,
                  )));
    },
    child: Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.white54,
              blurRadius: 3.0,
            ),
            BoxShadow(
              color: Colors.white54,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(content.urlToImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            child: Text(
              content.publishedAt,
              style: TextStyle(
                fontSize: 18,
                color: Colors.amber,
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              content.name,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            child: Text(
              content.description,
              style: TextStyle(fontSize: 16, color: Colors.amber),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                "Tap for more>>>",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
