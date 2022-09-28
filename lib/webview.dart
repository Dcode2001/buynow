import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class webview extends StatefulWidget {
  const webview({Key? key}) : super(key: key);

  @override
  State<webview> createState() => _webviewState();
}

class _webviewState extends State<webview> {

  final Uri _url = Uri.parse('https://www.amazon.in/');
  final Uri _url1 = Uri.parse('https://www.youtube.com/');
  final Uri _url2 = Uri.parse('https://www.hotstar.com/in');
  final Uri _url3 = Uri.parse('https://www.flipkart.com/?s_kwcid=AL!739!3!582822043916!e!!g!!flipkart&gclsrc=aw.ds&&semcmpid=sem_8024046704_brand_exe_buyers_goog&gclid=EAIaIQobChMI3O6ZsqjL-QIVAtdMAh0JZgnNEAAYASAAEgKvVvD_BwE');
  final Uri _url4 = Uri.parse('https://cdmi.in/');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Web View in App"),),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Center(
            child: ElevatedButton(onPressed: () async {


              try {
                await launchUrl(_url);
              } catch (e) {
                print(e);
              }

            }, child: Text("Amazon")),
          ),

          SizedBox(height: 15),

          Center(
            child: ElevatedButton(onPressed: () async {

              try {
                await launchUrl(_url1);
              } catch (e) {
                print(e);
              }

            }, child: Text("You Tube")),
          ),

          SizedBox(height: 15),

          Center(
            child: ElevatedButton(onPressed: () async {

              try {
                await launchUrl(_url2);
              } catch (e) {
                print(e);
              }

            }, child: Text("Hotstar")),
          ),

          SizedBox(height: 15),

          Center(
            child: ElevatedButton(onPressed: () async {

              try {
                await launchUrl(_url3);
              } catch (e) {
                print(e);
              }

            }, child: Text("Flipkart")),
          ),

          Center(
            child: ElevatedButton(onPressed: () async {

              try {
                await launchUrl(_url4);
              } catch (e) {
                print(e);
              }

            }, child: Text("cdmi")),
          ),
        ],
      ),

    );
  }
}
