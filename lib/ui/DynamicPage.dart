import 'package:flutter/widgets.dart';

class DynamicPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DynamicPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Text("动态",
          style: TextStyle(fontSize: 24)),
    );
  }
}
