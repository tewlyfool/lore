
import 'package:flutter/material.dart';

import 'main.dart';

class Conductor extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.green[600],
            title: Text("Character"),
            actions: <Widget>[IconButton(icon: Icon(Icons.home),onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                       ) );
            },),
             
            ],
          ),
          backgroundColor: Colors.greenAccent[100],
          body: ListView.builder(
            itemCount: 7,
            itemBuilder: (BuildContext context,int index){
              index = index+1;
              return Image.asset("assets/c$index"+".jpg");
            },
          ),
    );
  }
}