import 'chewie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'get_json.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData.dark(),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GetJson _getJson = GetJson();
  List<dynamic> data = List<dynamic>();
  @override
  void initState() {
    super.initState();
    getResponse();
  }

  getResponse() async {
    data = await _getJson.getData();
    setState((){

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (builder, index) {
          print("${data.length}");
          return ChewieListItem(
            videoPlayerController: VideoPlayerController.network(data[index]['sources']),
          );
        },
      ),
    );
  }
}
