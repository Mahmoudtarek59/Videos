import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  ChewieListItem({this.videoPlayerController, this.looping});
  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;
  bool play = false;

  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 16/9, // Prepare the video to be played and display the first frame
        autoInitialize: true,
        looping: widget.looping,
//        overlay: FlutterLogo(),
        showControlsOnInitialize: false,
        // Errors can occur for example when trying to play a video
        // from a non-existent URL
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16/9,
      child: Container(
        child: Stack(
          children: [
            Chewie(
              controller: _chewieController,
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 1, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ]),
                      child: IconButton(
                          icon: Icon(
                            Icons.thumb_down,
                            color: Colors.white,
                          ),
                          onPressed: () {})),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 1, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ]),
                    child: IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // IMPORTANT to dispose of all the used resources
//    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
