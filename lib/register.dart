import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  TextEditingController tname = TextEditingController();
  TextEditingController tcontact = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tpassword = TextEditingController();

 ImagePicker _picker = ImagePicker();
  String imagepath = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
                InkWell(
                  onTap:() async {

                    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

                   setState(() {
                     imagepath = photo!.path;
                   });

                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    child: imagepath.isEmpty
                    ? Icon(Icons.supervised_user_circle)
                        : Image.file(File(imagepath)),
                  ),
                ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tname,
                decoration: InputDecoration(
                  hintText: "name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tcontact,
                decoration: InputDecoration(
                  hintText: "enter contact"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: temail,
                decoration: InputDecoration(
                  hintText: "Enetr email"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tpassword,
                decoration: InputDecoration(
                  hintText: "Enter password"
                ),
              ),
            ),
            ElevatedButton(onPressed: () async {

              String name= tname.text;
              String contact= tcontact.text;
              String email= temail.text;
              String password= tpassword.text;

              waitDialog();
              String api =
              "https://mechemperor.000webhostapp.com/vspapi/register.php";

              //dio,http

              DateTime dt = DateTime.now();
              String imagename = "$name${dt.year}${dt.month}${dt.day}${dt.hour}${dt.minute}${dt.second}.jpg";

              var formData = FormData.fromMap({
                'name': name,
                'contact': contact,
                'email': email,
                'password': password,
                'file': await MultipartFile.fromFile(imagepath, filename: imagename),
              });

              var response = await Dio().post(api, data: formData);

              Navigator.pop(context);

              print('Response status: ${response.statusCode}');

              if(response.statusCode==200){
                print('Response body: ${response.data}');

                Map map = jsonDecode(response.data);

                int result = map['result'];
                if(result==0){
                  print("try again");
                }
                else if(result==1)
                {
                  //go to login page
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

