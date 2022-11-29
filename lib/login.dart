import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  TextEditingController tusername = TextEditingController();
  TextEditingController tpassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tusername,
                decoration: InputDecoration(
                  hintText: "email or contact",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tpassword,
                decoration: InputDecoration(
                    hintText: "enter password"
                ),
              ),
            ),
            ElevatedButton(onPressed: () async {

              String username= tusername.text;
              String password= tpassword.text;

              waitDialog();
              String api =
                  'https://mechemperor.000webhostapp.com/vspapi/login.php?username=$username&password=$password';

              //dio,http
              //get data
              var response = await Dio().get(api);
              print(response);

              Navigator.pop(context);

              if(response.statusCode==200){

                Map map = jsonDecode(response.data);

                int result = map['result'];

                if(result==0){

                  print("Invalid username or password");
                }
                else
                {
                  Map data = map['data'];

                  String id = data['id'];
                  String name = data['name'];
                  String email = data['email'];
                  String contact = data['contact'];
                  String password = data['password'];
                  String imagepath = data['imagepath'];
                }
              }

            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
  waitDialog()
  {
    showDialog(context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Container(
              height: 60,
              child: ListTile(
                leading: Container(
                  height: 50,
                  width:  50,
                  child: CircularProgressIndicator(),
                ),
                title: Text("Please wait..."),
              ),
            )
          ],
        );

      },);
  }
}
