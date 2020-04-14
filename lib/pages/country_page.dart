import 'dart:convert';
import 'package:corona_virus_tracker/pages/search.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CountryList extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/countries/?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                context:context,
                delegate: Search(countryData),
              );
            },
          ),
        ],
        centerTitle: true,
        title: Text('Country Statistics'),
      ),
      body: countryData==null?Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount: countryData == null ? 0 : countryData.length,
        itemBuilder: (context, index) {
          return Card(
                      child: Container(
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical:10),
              
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                        Image.network(countryData[index]['countryInfo']['flag'],height: 50, width: 60,)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('CONFIRMED:'+countryData[index]['cases'].toString(),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.red),),
                          Text('ACTIVE:'+countryData[index]['active'].toString(),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.blue)),
                          Text('RECOVERED:'+countryData[index]['recovered'].toString(),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.green)),
                          Text('DEATHS:'+countryData[index]['deaths'].toString(),style: TextStyle(fontWeight:FontWeight.bold,color: Theme.of(context).brightness==Brightness.dark?Colors.grey[100]:Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
