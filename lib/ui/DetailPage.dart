import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  int id;
  String name;

  DetailPage(this.id, this.name);

  @override
  _DetailPageState createState() => _DetailPageState(id,name);
}

class _DetailPageState extends State<DetailPage> {
  int id;
  String name;

  _DetailPageState(this.id, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: FlatButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text("点击返回+$id+$name"))
     );
  }
}