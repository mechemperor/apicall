import 'package:apicall/login.dart';
import 'package:apicall/utils.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String id = "";
  String name = "";
  String email = "";
  String contact = "";
  String password = "";
  String imagepath = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    id = Utils.prefs!.getString('id') ?? "";
    name = Utils.prefs!.getString('name') ?? "";
    email = Utils.prefs!.getString('email') ?? "";
    contact = Utils.prefs!.getString('contact') ?? "";
    password = Utils.prefs!.getString('password') ?? "";
    imagepath = Utils.prefs!.getString('imagepath') ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: ShapeDecoration(shape: CircleBorder(),
                      image: DecorationImage(image: NetworkImage("https://mechemperor.000webhostapp.com/$imagepath"),fit: BoxFit.fill),),

                  ),

                  TextField(
                    controller: TextEditingController(text: "id: $id"),

                    decoration: InputDecoration(
                      border: OutlineInputBorder(gapPadding:2)
                    ),
                  ),
                  TextField(controller: TextEditingController(text: "Name: $name"),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(gapPadding:2)
                    ),),
                  TextField(controller: TextEditingController(text: "Email: $email"),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(gapPadding:2)
                    ),),
                  TextField(controller: TextEditingController(text: "Contact: $contact"),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(gapPadding:2)
                    ),),
                  TextField(controller: TextEditingController(text: "Password: $password"),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(gapPadding:2)
                    ),),
                   ElevatedButton(onPressed: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                       return login();
                     },));
                   }, child: Text("Logout"))
                ],
              ),
    );

  }
}
