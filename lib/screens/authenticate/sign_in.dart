import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teste1/screens/home/register_video.dart';
import 'package:teste1/services/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({required this.toggleView});

  //const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

//Tentativa de Conexão com Google

class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {

        }
        else if (e.code == 'invalid-credential') {

        }
      } catch (e) {

      }
    }

    return user;
  }
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String? name;
  String? imageUrl;



  //Campos de Texto
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {

    //AppBar
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[100],
      appBar: AppBar(

        backgroundColor: Colors.blueAccent[400],
        elevation: 0.0,
        title: Text('Open Unifeob'),
        actions: <Widget> [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),

      //Começo do Body
      body: Container(

        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),

        decoration: const BoxDecoration(
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

              //Campo de E-mail
              TextFormField(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),

                  decoration: InputDecoration(
                    hintText: "Email" ,
                    labelText: "Email" ,
                    labelStyle: const TextStyle(color: Colors.black),

                    border: const OutlineInputBorder(),
                    icon: const Icon(Icons.account_box_outlined, color: Colors.black,) ,
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),

                  ),

                  validator: (val) => val!.isEmpty ? 'Não pode ser nulo' : null,
                onChanged: (val){
                  setState(() => email = val);

                }
              ),

              const SizedBox(height: 20,),

              //Campo de Senha
              TextFormField(
                obscureText: true,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,

                  ),

                  decoration: InputDecoration(
                    hintText: "Senha" ,
                    labelText: "Senha" ,
                    labelStyle: const TextStyle(color: Colors.black),

                    border: const OutlineInputBorder(),
                    icon: const Icon(Icons.account_box_outlined, color: Colors.black,) ,
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),

                  ),

                  validator: (val) => val!.length < 6 ? 'Não pode ser muito pequeno' : null,
                  onChanged: (val){
                    setState(() => password = val);
                  }
              ),

              const SizedBox(height: 20,),

              //Botão Login
              SizedBox(
                width: 200,
                height: 40,
                child: FlatButton(

                  color: Colors.white,
                  child: const Text(
                    'Entrar',
                    style: TextStyle(color: Colors.black, fontSize: 20),

                  ),
                  onPressed: () async {
                    if(_formkey.currentState!.validate()){
                      dynamic result = await _auth.signInWithFirebase(email, password);


                      if(result == null){
                        setState(() => error = 'Não pode fazer login com essas credenciais.');

                      }
                    }
                  },
                ),
              ),

              const SizedBox(height: 20,),

              //Botão do Google (não funciona)
              SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton.icon(
                  label: const Text('Sign In with Google'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),

                  icon: const Icon(Icons.email),

                  onPressed: () async {
                    GoogleSignIn().signIn();
                  },
                ),
              ),

              const SizedBox(height: 12,),


              //Imprime o erro caso haja um
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),

              // SizedBox(
              //   width: 200,
              //   height: 40,
              //   child: FlatButton(
              //
              //     color: Colors.white,
              //     child: const Text(
              //       'Entrar',
              //       style: TextStyle(color: Colors.black, fontSize: 20),
              //
              //     ),
              //     onPressed: ()  {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => RegisterVideo()),
              //       );
              //     },
              //   ),
              // ),

            ],

          ),

        ),

      ),
    );
  }
}
