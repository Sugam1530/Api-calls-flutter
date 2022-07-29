import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_recyclerview/Models/album_get_model.dart';
import 'package:get_api_recyclerview/Pages/secondPage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class firstPage extends StatefulWidget {
  const firstPage({Key? key}) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {

  List<AlbumGet> albumList = [];
  
  Future<List<AlbumGet>> getPostApi() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      albumList.clear();
      for(Map <String, dynamic> i in data){
        albumList.add(AlbumGet.fromJson(i));
      }
      return albumList;
    } else {
      return albumList;
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const secondPage()));
                },
              ),
              // add more IconButton
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: 
            FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                } else{
                  return ListView.builder(
                    itemCount: albumList.length,
                    itemBuilder: (context, index){
                      return Card(
                        margin: EdgeInsets.all(5.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage( albumList[index].thumbnailUrl.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(albumList[index].title.toString()),
                                    Text(albumList[index].id.toString()),
                                  ],
                                ),
                              ),
                            ]
                          ),
                        ),
                      );
                    });
                }
              }
            ),
          ),  
        ]
      ),
    );
  }
}