import 'package:flutter/material.dart';
import 'package:teste1/services/auth.dart';
import 'package:flutter/rendering.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({required this.toggleView});

  //const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}


class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  //text fields
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[400],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[100],
        elevation: 0.0,
        title: Text('Open Unifeob'),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        actions: <Widget> [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(

        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),

        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.7,
            image: AssetImage("background2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formkey,

          child: Column(

            children: <Widget> [

              SizedBox(height: 20,),
              TextFormField(

                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,

                  ),

                  decoration: InputDecoration(
                    hintText: "Email" ,
                    labelText: "Email" ,
                    labelStyle: TextStyle(color: Colors.black),

                    border: OutlineInputBorder(),
                    icon: Icon(Icons.account_box_outlined, color: Colors.black,) ,
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),

                  ),

                validator: (val) => val!.isEmpty ? 'Não pode ser nulo' : null,
                  onChanged: (val){
                    setState(() => email = val);

                  }
              ),

              SizedBox(height: 20,),
              TextFormField(
                  obscureText: true,

                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,

                  ),

                  decoration: InputDecoration(
                    hintText: "Senha" ,
                    labelText: "Senha" ,
                    labelStyle: TextStyle(color: Colors.black),

                    border: OutlineInputBorder(),
                    icon: Icon(Icons.account_box_outlined, color: Colors.black,) ,
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),

                  ),

                  validator: (val) => val!.length < 6 ? 'Não pode ser muito pequeno' : null,
                  onChanged: (val){
                    setState(() => password = val);
                  }
              ),

              SizedBox(height: 20,),
              SizedBox(
                width: 200,
                height: 40,
                child: FlatButton(

                  color: Colors.white,

                  child: Text(

                    'Register',
                    style: TextStyle(color: Colors.black, fontSize: 20),


                  ),
                  onPressed: () async {
                    if(_formkey.currentState!.validate()){
                      dynamic result = await _auth.registerWithFirebase(email, password);
                      if(result == null){
                        setState(() => error = 'please input an valid email');

                      }

                    }
                  },

                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton.icon(
                  label: Text('Sign Up with Google'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),

                  icon: Icon(Icons.email),

                  onPressed: () {},
                ),
              ),

              SizedBox(height: 12,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),

            ],

          ),

        ),

      ),
    );
  }
}
