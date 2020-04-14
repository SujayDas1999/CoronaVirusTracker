import 'package:flutter/material.dart';

class MostAffected extends StatelessWidget {
  final List countryData;

  const MostAffected({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Row(
            children: <Widget>[
              
              Image.network(countryData[index]['countryInfo']['flag'],height: 30,),
              SizedBox(
                width: 10.0,  
              ),
              Text(
                countryData[index]['country'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10.0,  
              ),
              Text(
                "Total cases:" + countryData[index]['cases'].toString(),
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
      itemCount: 5,
    ));
  }
}
