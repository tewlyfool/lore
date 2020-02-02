// import 'package:easy_alert/easy_alert.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'sl.dart';
class Game extends StatelessWidget {
  Game({Key key, this.s_title,this.l_title,this.n}) : super(key: key);
  final String s_title;
  final String l_title;
  final String n;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.s_title,
      home: MyHomePage(title: this.l_title, n : this.n),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,this.n}) : super(key: key);
  final String title;
  String n;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String n = ;
  
  

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[600],
            title: Text(widget.title),
            actions: <Widget>[IconButton(icon: Icon(Icons.home),onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                       ) );
            },),
              IconButton(icon: Icon( Icons.save) ,
              onPressed: 
              (){setState(() {

                saveD(this.widget.n);
                
                             Fluttertoast.showToast(
                            msg: "Save at "+this.widget.n+" Already",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.greenAccent,
                            textColor: Colors.black, 
                            // fontSize: 16.0
                        );
              });}
              )
            ],
          ),
          backgroundColor: Colors.greenAccent[100],
          body: next(widget.n),
        
      );
  }
  Widget next(n){
  var dic = {
      "cover":['a'],
      'a':['b'],'b':[1],
      1:[5,9], 2:[10,28],3:[16,12],4:[40,17,13],5:[8,11],6:[61],7:[3,27],8:[19,11],9:[4,7],10:[28,32],11:[14,2],12:[15,18]
      ,13:[62],14:[7,2],15:[38,4],16:[62],17:[2,24],18:[25,21],19:[23,7],20:[26,24],21:[36,25],22:[44],23:[20,7],24:[43,61],25:[15,24]
      ,26:[13,33],27:[16,24],28:[35,46],29:[61],30:[58,53],31:[63],32:[28,58],33:[62],34:[55,6],35:[51,37],36:[62],37:[53,30],38:[42,45]
      ,39:[56,58],40:[48,41],41:[61],42:[54,47],43:[34,50],44:[63],45:[42],46:[34,49],47:[16,54],48:[57,41],49:[22,39],50:[34],51:[49,37]
      ,52:[63],53:[22,39],54:[29,60],55:[61],56:[59,13],57:[44],58:[61],59:[52],60:[31],61:[],62:[],63:[]
      };
  var ending = {61:6199,62:6299,63:6399};
  String nn = '$n';
  var d = dic[n];
  if(d==null){
    
    d=dic[int.parse(n)];
    if(int.parse(n)<10){
      nn="0"+n;
    }
  
  }
  return ListView(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(border: Border.all(width: 4,color: Colors.black)),
       child : Image.asset('assets/'+nn+'00.jpg')
       )
       , 
    ]+ anwser(d,nn),
    
  );
  }
 BoxDecoration anwserDec() {
  return BoxDecoration(
    borderRadius:BorderRadius.all(Radius.circular(13.0)),
    border: Border(
      left: BorderSide( //                   <--- left side
        color: Colors.black,
        width: 3,
      ),
      top: BorderSide( //                    <--- top side
        color: Colors.blue[800],
        width: 4,
      ),
      bottom: BorderSide(color: Colors.white,width: 7),
      right: BorderSide(color: Colors.black,
        width: 3,)
    ),
  );
}
  List<Widget> anwser(List x,String n) {
  List<Widget> list = new List();
  int t = 1;
  for(int i=0;i<x.length;i++){
    list.add(
      FractionallySizedBox(
        
        widthFactor: 0.725,
        // heightFactor: 0.1,
      child: Container(
      // color: Colors.greenAccent,
      // decoration: anwserDec(),
      child: FlatButton(colorBrightness: Brightness.dark,
      // shape: roundbutton(),
      child:
      ClipRRect( 
        
        borderRadius: BorderRadius.circular(8.5),
        child:Image.asset('assets/'+n+'0$t'+'.jpg',)

        )
        , onPressed: () { 
        // Future.delayed(Duration(seconds: 10));
        setState(() {
        var ii = x[i];
        this.widget.n = "$ii";  }); 
        },
      ) 
      )
   , 
      )
    );
    list.add(Text(''));
    t+=1;
  }
  if(list.length == 0){
    return [
      Image.asset('assets/'+'$n'+'99.jpg')
      ,
      IconButton(icon: Icon(Icons.autorenew),onPressed:(){setState(() {
      this.widget.n  = 'cover';
    });},) ,
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Column(children: <Widget>[
        Text('E-book' ,style: TextStyle(fontWeight: FontWeight.bold),),
        FlatButton(
        child: 
        Tab(
          text: 'Meb',
          icon: new Image.network('https://www.mebmarket.com/web/assets/images/ico/favicon.ico'
          ,width: 46,height: 46,  )
        ,
        ) 
        ,
        onPressed: (){_launchURL('https://www.mebmarket.com/index.php?action=BookDetails&book_id=40789&page_no=1');},
        )

      ],)
      ,Column(children: <Widget>[
        Text('Book',style: TextStyle(fontWeight: FontWeight.bold)),
        FlatButton(
          child: Tab(
            text: "Siam Inter",
            icon:new Image.network('https://siamintercomics.com/wp-content/themes/sics/images/sic-logo-icon.png' 
            ,width: 46,height: 46, ),
           ) ,onPressed: (){
            _launchURL('https://siamintershop.com/product/4692/%E0%B9%81%E0%B8%A2%E0%B8%81%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1-%E0%B8%8A%E0%B8%A1%E0%B8%A3%E0%B8%A1%E0%B8%A7%E0%B8%B2%E0%B8%A3%E0%B8%AA%E0%B8%B2%E0%B8%A3%E0%B8%95%E0%B8%B3%E0%B8%99%E0%B8%B2%E0%B8%99%E0%B8%AA%E0%B8%96%E0%B8%B2%E0%B8%9A%E0%B8%B1%E0%B8%99-%E0%B9%80%E0%B8%A5%E0%B9%88%E0%B8%A1-1-6');
          },)

      ],)
       
        
      ],
      )
      ] ; // return
  }
  return list;
  }
  _launchURL(String url) async {
  // const url = 'https://www.mebmarket.com/index.php?action=BookDetails&book_id=40789&page_no=1';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}

RoundedRectangleBorder roundbutton(){
  return RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.green,width: 2)
            
            // side: BorderSide(color: Colors.red)
);
}