import 'package:flutter/material.dart';
import 'package:xiaopang/model/SucculentBean.dart';
import 'AddPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xiaopang/db/DatabaseHelper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SucculentBean> succulentLists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:!showToTopBtn ? null : getFloatingButton(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: getGridView(),
      ),
    );
  }

  Widget getFloatingButton(){
    return FlatButton (
        child: new MaterialButton(
          child: new Icon(Icons.add_circle,color: Colors.green,size: 60,),
            onPressed: (){
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder:(BuildContext context){
            return getDialog();
          }).then((val) {
            print(val);
          });
        })
    );
  }

  SimpleDialog getDialog(){
    var image;
    return SimpleDialog(
      children: <Widget>[
        ListTile(
          title: Center(child: Text("相册")),
          onTap: () async{
            Navigator.pop(context);
            image =  await ImagePicker.pickImage(source: ImageSource.gallery);
            if(image != null){
              Navigator.push(context, new MaterialPageRoute(builder:(context)  => new AddPage(image)));
            }
          },
        ),
        ListTile(
          title: Center(child: Text("拍照")),
          onTap: () async{
            Navigator.pop(context);
            image =  await ImagePicker.pickImage(source: ImageSource.camera);
            if(image != null){
              Navigator.push(context, new MaterialPageRoute(builder:(context)  => new AddPage(image)));
            }
          },
        ),
        ListTile(
          title: Center(child:  Text("取消")),
          onTap: (){
            Navigator.pop(context);
          },
        )
      ],
    );
  }
  void onDialogTap(){

  }
  Widget getGridView(){
    return GridView(
      controller: _controller,
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      children: succulentLists.map((item) => Container(
        padding: EdgeInsets.all(5),
        child: new Image.asset(item.url),
      ))
          .toList(),
    );
  }


  ScrollController _controller = new ScrollController();
  bool showToTopBtn = true;

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      if (_controller.offset < 100) {
        setState(() {
          showToTopBtn = true;
        });
      } else if (_controller.offset >= 100 ) {
        setState(() {
          showToTopBtn = false;
        });
      }
    });
    print("initState");
    getData();
  }

  @override
  void deactivate() {
    super.deactivate();
    var bool = ModalRoute.of(context).isCurrent;
    if (bool) {
      getData();
    }
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  void getData() async {
    succulentLists= await DatabaseHelper.internal().selectSucculents() as List<SucculentBean>;
    setState(() {

    });
  }
}
