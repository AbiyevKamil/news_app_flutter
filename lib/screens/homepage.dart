import 'package:flutter/material.dart';
import 'package:news_app/models/news_data.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/widgets/news.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<NewsData> data = [];
  void getData() async {
    ApiService apiService = ApiService();
    List<NewsData> temp = await apiService.getData();
    setState(() {
      data = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(
            'News App',
            style: TextStyle(
              color: Colors.amber,
            ),
          ),
        ),
        body: data.length > 0
            ? Container(
                color: Colors.grey[900],
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      newsItem(data[index], context),
                ),
              )
            : Container(
                color: Colors.grey[900],
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                ),
              ));
  }
}


// child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: 
//             data.length > 0 ? 
//               [
                
//               ] : [Text('data')]
//         ),

