import 'package:apicall/homepage.dart';
import 'package:apicall/login.dart';
import 'package:apicall/register.dart';
import 'package:apicall/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


    Utils.prefs = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 2));

    bool loginstatus = Utils.prefs!.getBool('loginstatus') ?? false ;

    if(loginstatus==true)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return home();
        },));
      }
else
  {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return login();
    },));
  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(child: Text("Loading...."),),
        )
    );
  }
}

