// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

class Conductor extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(body: Center(
                        child: YoutubePlayer(
                                  context: context,
                                  source: "AHpcw4aOtgs",
                                  quality: YoutubeQuality.HIGH,
                                  isLive: true,
                                  //  quality: null, 
                                  // callbackController: (controller) {
                                  // _videoController = controller;
                                  // quality: null,
                          ),
                      ),);
  }
}