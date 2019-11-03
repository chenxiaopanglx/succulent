import 'package:flutter/material.dart';
import 'package:xiaopang/utils/StringUtils.dart';
import 'dart:io';
import 'package:xiaopang/db/DatabaseHelper.dart';
import 'package:xiaopang/model/SucculentBean.dart';

class AddPage extends StatefulWidget {
  File image;

  AddPage(this.image);

  @override
  _AddPageState createState() => _AddPageState(image);
}

class _AddPageState extends State<AddPage> {
  File _image;

  _AddPageState(this._image);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _sellerController = TextEditingController();
    TextEditingController _priceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(StringUtils.addTitle),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.check), onPressed: () async {
            SucculentBean succulentBean= new SucculentBean();
            succulentBean.name= "我新买的";
            succulentBean.url= "img/IMG_8211.JPG";
            await DatabaseHelper.internal().insertSucculent(succulentBean);
            Navigator.pop(context);
          })
        ],
      ),
      body: new Scrollbar(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
              children: <Widget>[
                TextField(decoration: InputDecoration(hintText: "请输入多肉名称"),keyboardType: TextInputType.text,controller: _nameController,),
                TextField(decoration: InputDecoration(hintText: "请输入卖家"),keyboardType: TextInputType.text,controller: _sellerController,),
                TextField(decoration: InputDecoration(hintText: "请输入价格"),keyboardType: TextInputType.number,controller: _priceController,),
                Container(
                  child: Image.file(_image),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
