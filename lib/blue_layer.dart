import 'package:flutter/material.dart';

class BlueLayer extends StatefulWidget {
  BlueLayer({Key key, this.title}) : super(key: key);

  BlueLayerDelegate delegate;

  String title;

  @override
  _BlueLayerState createState() => _BlueLayerState();
}

class _BlueLayerState extends State<BlueLayer> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 80,
              color: Colors.blue,
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
      widget.title = widget.delegate.getTitleForBlueLayer();
    });
  }
}

abstract class BlueLayerDelegate {
  String getTitleForBlueLayer();
}
