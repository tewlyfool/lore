import 'package:flutter/material.dart';

class AutoScrollPage extends StatefulWidget {
  @override
  AutoScrollPageState createState() => AutoScrollPageState();
}

class AutoScrollPageState extends State<AutoScrollPage> with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  bool scroll = true;
  int speedFactor = 60;


  _scroll() {
    double maxExtent = _scrollController.position.maxScrollExtent;
    double distanceDifference = maxExtent - _scrollController.offset;
    double durationDouble = distanceDifference / speedFactor;

    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: durationDouble.toInt()),
        curve: Curves.linear);
  }

@override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scroll();
    });
    super.initState();
  }

    @override
  void dispose() {
    ///Don't forget to clean up resources when you are done using it
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
                                                                                                                                                  
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            sins( sh()),
            tbins("จัดทำ"),
            tins("นายพงศธร  งามตา"),
            sins(btw()),
            tbins("เรื่องและภาพ"),
            tins("เกษม อภิชนตระกูล"),
            sins(btw()),
            tbins("ตัดภาพแบบชุ่ยๆ และ ละเมิดลิขสิทธ์"),
            tins("นายพงศธร  งามตา"),
            sins(btw()),
            tbins("แต่เนื่องจากทำเพื่อการศึกษา"),
            tins("จึงรอดไป"),

            sins(st()),
            
            Container(),
            RaisedButton(
              child: 
              Text("กลับไปหน้าเมนูหลัก"),
              // Icon(Icons.keyboard_backspace),
              // color: Colors.yellow,
            onPressed: (){
              Navigator.pop(context);
            },)
            ],)
          
        ),
    );
  }
}

Text tins(String s){
  return Text( s, maxLines: 30, 
            style: TextStyle(color: Colors.white, fontSize: 18.0),textAlign: TextAlign.center,  );
}
Text sins(String s){
  return Text( s, maxLines: 3000,
            style: TextStyle(color: Colors.yellow, fontSize: 25.0 ),  );
}
Text tbins(String s){
  return Text( s, maxLines: 30, 
            style: TextStyle(color: Colors.white, fontSize: 22.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,  );
}
String btw(){
  String t = '''
  


  
  ''';
  return t;
}
String st(){
   String t = '''                                                                                                                                                                                         

























''';
return t;
}
String sh(){
 String t =  '''                                                                                                                                                                                         


























''';
 return t;
}
