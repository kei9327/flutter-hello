import 'package:flutter/material.dart';

import 'blue_layer.dart';
import 'yellow_layer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    implements BlueLayerDelegate, YellowLayerDelegate {

  BlueLayer blueLayer;
  YellowLayer yellowLayer;

  @override
  Widget build(BuildContext context) {
    blueLayer = BlueLayer(title: "파랑버튼");
    blueLayer.delegate = this;

    yellowLayer = YellowLayer(title: "노랑버튼");
    yellowLayer.delegate = this;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: blueLayer
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: yellowLayer
                ),
              ],
            )
          )
        ],
      ),
    );
  }

  @override
  String getTitleForBlueLayer() => yellowLayer.title;

  @override
  String getTitleForYellowLayer() => blueLayer.title;
}
