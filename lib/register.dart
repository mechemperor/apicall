import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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

              Map m = {
                'name': name,
                'contact': contact,
                'email': email,
                'password': password
              };

              var url = Uri.parse(api);
              var response = await http.post(url, body: m);

              Navigator.pop(context);

              print('Response status: ${response.statusCode}');

              if(response.statusCode==200){
                print('Response body: ${response.body}');
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

