import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_recyclerview/Models/cat_get_model.dart';
import 'package:get_api_recyclerview/Pages/secondPage.dart';
import 'package:http/http.dart' as http;


class seventhPage extends StatefulWidget {
  const seventhPage({Key? key}) : super(key: key);

  @override
  State<seventhPage> createState() => _seventhPageState();
}

class _seventhPageState extends State<seventhPage> {

  List<Entries> entriesList = [];
  List<int> count = [];
  

  Future getCatApi() async{
    final response = await http.get(Uri.parse("https://api.publicapis.org/entries"));
    Map<String, dynamic> map = jsonDecode(response.body.toString());
    List<dynamic> data = map["entries"];
    count.add(map["count"]);


    if(response.statusCode == 200){
      entriesList.clear();
      for(Map <String, dynamic> i in data){
        entriesList.add(Entries.fromJson(i));
      }
      return entriesList;
    } else {
      return entriesList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Calls"),
        actions: [
          IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const secondPage()));
                },
              ),
              // add more IconButton
        ],
      ),
      body:Column(
        children: [
          Expanded(child: FutureBuilder(
            future: getCatApi(),
            builder: (context,snapshot) {
              if(!snapshot.hasData){
                return Center(child: const CircularProgressIndicator());
              } else{ return
                Column(
                  children: [
                    Text(count[0].toString()),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: entriesList.length,
                      itemBuilder: (context, index){
                        return Card(
                          child: Column(
                            children: [
                              Text(entriesList[index].description.toString()),
                              Text(entriesList[index].category.toString()), 
                              // Text(count[0].toString())
                            ],
                          ),
                        );
                      }
                    )
                  ],
                );
              }
            }
            )
          ),
        ],
      )
    );
  }
}