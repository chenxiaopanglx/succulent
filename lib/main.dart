import 'package:flutter/material.dart';
import 'package:xiaopang/ui/HomePage.dart';
import 'package:xiaopang/ui/MinePage.dart';
import 'package:xiaopang/utils/StringUtils.dart';
void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: MyStateWidget(),
    );
  }
}

class MyStateWidget extends StatefulWidget {
  @override
  _MyStateWidget createState() {
    // TODO: implement createState
    return _MyStateWidget();
  }
}

class _MyStateWidget extends State<MyStateWidget> {
  var textStyle = new TextStyle(
    fontSize: 16,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(StringUtils.aboutUs),centerTitle: true
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.fromLTRB(100,50,100,10),
              width:100,
              height: 100,
              child: new Image.asset("img/IMG_7612.JPG",scale: 10),
            ),
            new Text(StringUtils.userName,style: TextStyle(fontSize: 20),),
            new SizedBox(
              height: 30,
            ),
            new ListTile(
              title: Text(StringUtils.slideMenuMy,style: textStyle,),
              trailing: new Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            new Divider(),
            new ListTile(
              title: Text(StringUtils.slideMenuBuy,style: textStyle,),
              trailing: new Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);

              },
            ),
            new Divider(),
            new ListTile(
              title: Text(StringUtils.slideMenuCollection,style: textStyle,),
              trailing: new Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);

              },
            ),
            new Divider(),
            new ListTile(
              title: Text(StringUtils.slideMenuDie,style: textStyle,),
              trailing: new Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);

              },
            ),
            new Divider(),
            new ListTile(
              title: Text(StringUtils.slideMenuVersion,style: textStyle,),
              trailing: new Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            new Divider(),
            new ListTile(
              title: Text(StringUtils.slideMenuAbout,style: textStyle,),
              trailing: new Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context,new MaterialPageRoute(builder: (context) => new  MinePage()));
              },
            ),
            new Divider(),
          ],
        ),
      ),
      body: new HomePage(),
    );
  }
}
