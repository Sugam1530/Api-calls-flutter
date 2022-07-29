import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_recyclerview/Pages/firstpage.dart';
import 'package:http/http.dart' as http;
import '../Models/posts_model.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostsModel> postList = [];

  Future<List<PostsModel>>getPostApi() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      postList.clear();
      for(Map<String, dynamic> i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return  postList;
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const firstPage()));
                },
              ),
              // add more IconButton
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot){
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                } else{
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index){
                    return Card(
                      color: Colors.cyan,
                      margin: EdgeInsets.all(5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Title: " + postList[index].title.toString()),
                            Text("Description: " + postList[index].body.toString())
                          ],
                        ),
                      ),
                    );
                  });
                }
              }
            ),
          )
        ])
    );
  }
}

