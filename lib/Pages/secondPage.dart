import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_recyclerview/Models/complex_get_model.dart';
import 'package:get_api_recyclerview/Pages/firstpage.dart';
import 'package:get_api_recyclerview/Pages/thirdPage.dart';
import 'package:http/http.dart' as http;

class secondPage extends StatefulWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {

  List<ComplexGet> complexList = [];

  Future<List<ComplexGet>>getPostApi() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      complexList.clear();
      for(Map<String,dynamic>i in data){
        complexList.add(ComplexGet.fromJson(i));
      }
      return complexList;
    } else {
      return complexList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Calls"),
        actions: [
          IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> thirdPage()));
                },
              ),
              // add more IconButton
        ],
      ),
      body: Column(
        children: [
          Expanded(child: 
          FutureBuilder(
            future: getPostApi(),
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return CircularProgressIndicator();
              } else{
                return ListView.builder(
                  itemCount: complexList.length,
                  itemBuilder: (context, index){
                    return  Card(
                      color: Colors.cyan,
                      margin: EdgeInsets.all(5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(complexList[index].name.toString()),
                            Text(complexList[index].username),
                            Text(complexList[index].email),
                            Text(complexList[index].address.city.toString()),
                            Text(complexList[index].address.street.toString()),
                            Text(complexList[index].address.zipcode.toString()),
                          ],
                        ),
                      ),
                    );
                });
              }
            },
            ),
          )
        ],
      ),
    );
  }
}