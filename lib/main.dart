import 'package:apicall/login.dart';
import 'package:apicall/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: login(),));
}

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    go();

  }

  go()async
  {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return register();
    },));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Text("Loading...."),
        )
    );
  }
}

