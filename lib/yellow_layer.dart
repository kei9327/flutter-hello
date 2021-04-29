import 'package:flutter/material.dart';

class YellowLayer extends StatefulWidget {
  YellowLayer({Key key, this.title}) : super(key: key);

  YellowLayerDelegate delegate;

  String title;

  @override
  _YellowLayerState createState() => _YellowLayerState();
}

class _YellowLayerState extends State<YellowLayer> {
  _YellowLayerState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150,
            height: 80,
            color: Colors.yellow,
            padding: EdgeInsets.all(15),
            child: RaisedButton(
              child: Text(
                '${widget.title}',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: changeText,
              textColor: Colors.white,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  void changeText() {
    setState(() {
      widget.title = widget.delegate.getTitleForYellowLayer();
    });
  }
}

abstract class YellowLayerDelegate {
  String getTitleForYellowLayer();
}
