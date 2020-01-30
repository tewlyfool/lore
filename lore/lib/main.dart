import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player/youtube_player.dart';
import 'conductor.dart';
import 'game.dart';
void main() => runApp(MyApp());
String short_title = 'Lore';
String long_title = 'LOVE-LITerary';
// Future<SharedPreferences> prefs =  SharedPreferences.getInstance();
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
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),),
          RaisedButton(
              child:Text(' '*6+'New Game'+' '*6),
              shape: roundbutton(), 
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Game(s_title: short_title,l_title: long_title,n: 1,)),
                       );
              },
              color: bgbutton ,
              
              ),
          RaisedButton(
              child:Text(' '*6+'Load Game'+' '*6),
              shape: roundbutton(), 
              onPressed: () {
                int n = 0;
                if(n==0){
                    Fluttertoast.showToast(
                            msg: "ยังไม่เสร็จ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: bgbutton,
                            textColor: Colors.black, 
                            // fontSize: 16.0
                        );
                }else{
                }
                

              },
              color: bgbutton ,
              ),
          // RaisedButton(
          //     child:Text('9'* 25 ),
          //     shape: roundbutton(), onPressed: () {},) ,
          Row(mainAxisAlignment: MainAxisAlignment.center
            ,children : <Widget>[
          RaisedButton  (
                child:Text('Conductor'),
                shape: roundbutton(), 
                onPressed: () {},
                color: bgbutton ,
                ),
          Text(' '),
          FloatingActionButton( child: Icon(Icons.priority_high,color: Colors.black,), 
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
                  backgroundColor: Colors.grey[350],
                  mini: true,
                  ) 
          
          ]
              ),
          RaisedButton(
              child: Text(' '*11+'About'+' '*11),
              shape: roundbutton(), 
              onPressed: () {},
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
            // side: BorderSide(color: Colors.red)
);
}