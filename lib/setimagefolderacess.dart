import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  List someImages = [];

  @override
  void initState() {
    super.initState();

    _initImages();
  }

  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('Images/'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() {
      someImages = imagePaths;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Set Images acess folder"),
          ),
          body: GridView.builder(
              itemCount: someImages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Image(
                    image: AssetImage(someImages[index]),
                    fit: BoxFit.fill,
                    height: 200,
                    width: 200,
                  ),
                );
              },
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4))),
    );
  }
}
