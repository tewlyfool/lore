import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lore/sl.dart';
import 'about.dart';
import 'conductor.dart';
import 'game.dart';
void main() => runApp(MyApp());

String short_title = 'Lore';
String long_title = 'LOVE-LITerary';
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'lore',home: StartMenu(),);
  }
}
class StartMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Color bg = Colors.greenAccent[100];
    Color bgbutton = Colors.greenAccent;
    return Scaffold(
      backgroundColor: bg,
      body:Center(
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: bg,
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
            child: ClipRRect( 
        
        borderRadius: BorderRadius.circular(90),
        child:Image.asset('assets/logo.jpg' ,)

        ),),
          RaisedButton(
              child:Text(' '*6+'New Game'+' '*6),
              shape: roundbutton(), 
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Game(s_title: short_title,l_title: long_title,n: "cover",)),
                       );
              },
              color: bgbutton ,
              
              ),
          RaisedButton(
              child:Text(' '*6+'Load Game'+' '*6),
              shape: roundbutton(), 
              onPressed: () {
                readD().then((param) {
                if(param==null){
                  
                  Fluttertoast.showToast(
                msg: "ไม่พบ save",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: bgbutton,
                textColor: Colors.black, 
                // fontSize: 16.0 
                );
                }else{
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Game(s_title: short_title,l_title: long_title, n: param,)),
                       );
                }
                }) ;
                

              },
              color: bgbutton ,
              ),
          
          Row(mainAxisAlignment: MainAxisAlignment.center
            ,children : <Widget>[
          RaisedButton  (
                child:Text('Conductor'),
                shape: roundbutton(), 
                onPressed: () {
                         Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return MaterialApp(title: short_title,home: 
                      Conductor()
                      ,);
                    }),
                       );
                },
                color: bgbutton ,
                ),
          Text(' '),
          FloatingActionButton( 
                  child: Icon(Icons.priority_high,color: Colors.black,), 
                  onPressed: (){
                  FlutterYoutube.playYoutubeVideoById(
                          apiKey: "AIzaSyA3MqOoJ6Ml_aPsZ6qtv6UWf34Va-RkAhc",
                          // apiKey: "<API_KEY>",
                          videoId: "AHpcw4aOtgs",
                          autoPlay: true,
                        ) ;
                  }
                  ,
                  backgroundColor: Colors.grey[350],
                  mini: true,
                  ) 
          
          ]
              ),
          RaisedButton(
              child: Text(' '*11+'About'+' '*11),
              shape: roundbutton(), 
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context)=>AutoScrollPage()
                  )
                );              },
              color: bgbutton ,
              ),
          ],
    )
    )
    );
  }
}
RoundedRectangleBorder roundbutton(){
  return RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.green,width: 2)
);
}
