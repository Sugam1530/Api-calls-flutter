
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_api_recyclerview/Pages/secondPage.dart';
import 'package:get_api_recyclerview/Pages/sixthPage.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';



class fifthPage extends StatelessWidget {
  fifthPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fifth Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const secondPage()));                  
            },
          ),              // add more IconButton
        ],
      ),
      body: Center(       
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(25),
              child: TextFormField(
                controller: emailController,
                // ignore: prefer_const_constructors
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon
                // ignore: prefer_const_constructors
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                    const BorderSide(color: Colors.blue, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Email",
                // ignore: prefer_const_constructors
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "verdana_regular",
                  fontWeight: FontWeight.w400,
                ),
                labelText: 'Email',
                    //lable style
                // ignore: prefer_const_constructors
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "verdana_regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ), 
            Container(
              margin: const EdgeInsets.all(25),
              child: TextFormField(
                controller: passwordController,
                // ignore: prefer_const_constructors
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon
                // ignore: prefer_const_constructors
                prefixIcon: Icon(
                  Icons.password,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                    const BorderSide(color: Colors.blue, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Password",
                // ignore: prefer_const_constructors
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "verdana_regular",
                  fontWeight: FontWeight.w400,
                ),
                labelText: 'Password',
                    //lable style
                // ignore: prefer_const_constructors
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "verdana_regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ),
          ElevatedButton(onPressed: () async{
            Navigator.push(context, MaterialPageRoute(builder: (context)=> sixthPage()));
            final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            sharedPreferences.setString('email', emailController.text.toString());
            sharedPreferences.setString('password',passwordController.text.toString());
          
          }, 
          child: 
          const Text("Next Page"),          
          )
        ],
        ),
      ),
    );
  }
}