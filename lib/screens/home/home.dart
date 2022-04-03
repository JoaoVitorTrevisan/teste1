import 'package:flutter/material.dart';
import 'package:teste1/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  Home({Key? key}) : super(key: key);

  final List<Map> myProducts =
  List.generate(20, (index) => {"id": index, "name": "Product $index"})
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        title: Text('Open Unifeob'),
        elevation: 0.0,
        actions:<Widget> [
          FlatButton.icon(
            icon: Icon(Icons.person),
            onPressed:() async {
              await _auth.signOut();
            },
            label: Text('Logout'),
          )
        ],
      ),
      body: Padding(

        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(

            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 4 / 3 ,
                crossAxisSpacing: 40,
                mainAxisSpacing: 40),
            itemCount: myProducts.length,
            itemBuilder: (BuildContext ctx, index) {

              return Container(

                alignment: Alignment.center,
                child: Text(myProducts[index]["name"]),
                decoration: BoxDecoration(

                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
              );
            }),
      ),
    );

  }
}
