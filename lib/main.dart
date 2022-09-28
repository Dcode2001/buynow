import 'package:buynow/drawerandbottomnavbar.dart';
import 'package:buynow/setimagefolderacess.dart';
import 'package:buynow/temparoryactivity.dart';
import 'package:buynow/webview.dart';
import 'package:flutter/material.dart';

import 'buynow.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Purchase",
      // home: webview(),
      home: demo(),
      // home: buynow(),
      // home: drawerandbottomnavbar(),
      // home: temporaryactivity(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
    ),
  );
}
