import 'package:buynow/drawerandbottomnavbar.dart';
import 'package:flutter/material.dart';

class temporaryactivity extends StatefulWidget {
  const temporaryactivity({Key? key}) : super(key: key);

  @override
  State<temporaryactivity> createState() => _temporaryactivityState();
}

class _temporaryactivityState extends State<temporaryactivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          title: Text("Amazon App Demo"),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 200,
          titleSpacing: 7),
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return Center(
                child: Container(
                  color: Colors.brown,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return second();
                          },
                        ));
                      },
                      child: Text("Go Next")),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
