import 'package:flutter/material.dart';

class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 80 / 2,
      width: width / 2,
      color: this.panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: this.textColor),
          ),
          Text(
            this.count,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color:textColor),
          ),
        ],
      ),
    );
  }
}
