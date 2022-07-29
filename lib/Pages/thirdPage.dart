import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';


class thirdPage extends StatefulWidget {
  const thirdPage({Key? key}) : super(key: key);

  @override
  State<thirdPage> createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Calls"),
        actions: [
          IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              // add more IconButton
        ],
      )
    );
  }
}