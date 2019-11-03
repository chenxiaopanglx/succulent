import 'package:flutter/material.dart';
import 'package:xiaopang/utils/StringUtils.dart';
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringUtils.slideMenuAbout),centerTitle: true,),
      body: Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.fromLTRB(100,50,100,10),
            padding: EdgeInsets.only(bottom: 35),
            width:double.infinity,
            height: 270,
            child: new Image.asset("img/IMG_7612.JPG"),
          ),
          Text(StringUtils.aboutUs,style: TextStyle(fontSize: 22),)
        ],
      ),
    );
  }
}
