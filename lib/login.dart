import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController usernamecontroller = new TextEditingController();
TextEditingController passwordcontroller = new TextEditingController();
class _LoginState extends State<Login> {
  @override
  void initState() {

    super.initState();
    //getuserlist();
    postuserlist();
  }

  getuserlist() async {
    var dio = Dio();
    final response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
    print(response.data["title"]);
  }

 postuserlist()async{
   
   print(usernamecontroller.text);
   print(passwordcontroller.text);

   try{
     var dio = Dio();
     final response = await dio.post('http://ec2-35-83-63-15.us-west-2.compute.amazonaws.com:8000/user/login',
     data:{
       "username": usernamecontroller.text,
       "password": passwordcontroller.text,
       "device_token":"12345678"
       });

       print(response.data);
       if(response.data["success"]==true){
         print(response.data["token"]);
       }else{

       }

   }catch(e){
     print(e);
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.deepPurple,
    body: Container(
      child: Column(children: [
        TextField(
          controller: usernamecontroller,
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: passwordcontroller,
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () { 
            postuserlist();
           },
          child: Text("Login"),
        ),
      ]),
    ),);
  }
}