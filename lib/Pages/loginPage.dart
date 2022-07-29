import 'package:flutter/material.dart';
import 'package:get_api_recyclerview/Pages/homeScreen.dart';
import 'package:http/http.dart' as http;


class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    
    try{

      http.Response response = await http.post(
        Uri.parse("https://reqres.in/api/register"), 
        body: {
          'email' : email,
          'password' : password
        }
      );
      if(response.statusCode == 200){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
      } else{
        final snackBar = SnackBar(
          content: Text("Please provide correct details"),
          action: SnackBarAction(label: 'Dismiss', onPressed: (){}),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

    } catch(e){
      print(Exception(e.toString()));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                },
              ),
              // add more IconButton
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              TextField(controller: emailController,),
              TextField(controller: passwordController,),
              ElevatedButton(onPressed: () {
                login(emailController.text.toString().trim(), passwordController.text.toString().trim());
              }, child: Text("login")),
            ],
          ),
        ),
      ),
    );
  }
}