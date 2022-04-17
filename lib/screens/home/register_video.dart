import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/auth.dart';

class RegisterVideo extends StatefulWidget {

  final AuthService _auth = AuthService();

   RegisterVideo({Key? key}) : super(key: key);

  @override
  State<RegisterVideo> createState() => _RegisterVideoState();


}

class _RegisterVideoState extends State<RegisterVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        title: Text('Open Unifeob'),
        elevation: 0.0,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),

        child: Form(
          child: Column(
              children: <Widget> [
                SizedBox(height: 20,),
                TextFormField(

                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,

                    ),

                    decoration: InputDecoration(
                      hintText: "Título" ,
                      labelText: "Título" ,
                      labelStyle: TextStyle(color: Colors.black),

                      border: OutlineInputBorder(),
                      icon: Icon(Icons.account_box_outlined, color: Colors.black,) ,
                      filled: true,
                      fillColor: Colors.blue.withOpacity(0.2),

                    ),

                ),

                SizedBox(height: 20,),

                TextFormField(

                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,

                  ),

                  decoration: InputDecoration(
                    hintText: "Curso" ,
                    labelText: "Curso" ,
                    labelStyle: TextStyle(color: Colors.black),

                    border: OutlineInputBorder(),
                    icon: Icon(Icons.add_business_outlined, color: Colors.black,) ,
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.2),

                  ),

                ),

                SizedBox(height: 20,),

                TextFormField(

                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,

                  ),

                  decoration: InputDecoration(
                    hintText: "URL" ,
                    labelText: "URL" ,
                    labelStyle: TextStyle(color: Colors.black),

                    border: OutlineInputBorder(),
                    icon: Icon(Icons.camera_enhance_outlined, color: Colors.black,) ,
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.2),

                  ),

                ),

                SizedBox(height: 20,),

                SizedBox(
                  width: 200,
                  height: 40,
                  child: OutlineButton(
                    color: Colors.white10,

                  child: Text(
                    'Registrar Vídeo',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),



                  //Verifica se o e-mail é válido
                  onPressed: () async {},

                ),
                ),

              ],
          ),
        ),
      ),
    );
  }
}
