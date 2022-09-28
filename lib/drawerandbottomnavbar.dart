import 'package:flutter/material.dart';

class drawerandbottomnavbar extends StatefulWidget {
  const drawerandbottomnavbar({Key? key}) : super(key: key);

  @override
  State<drawerandbottomnavbar> createState() => _drawerandbottomnavbarState();
}

class _drawerandbottomnavbarState extends State<drawerandbottomnavbar> {
  int cnt = 0;

  List<Widget> l = [first(), second(), third()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
        appBar: AppBar(
          title: Text("Drawer & BottomNavigationBar & TabBar"),
          bottom: TabBar(tabs: [
            Tab(child: Text("CHATS")),
            Tab(child: Text("STATUS")),
            Tab(child: Text("CALLS"))
          ]),
        ),

        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                cnt = value;
              });
            },
            currentIndex: cnt,
            selectedFontSize: 25,
            selectedItemColor: Colors.white,
            iconSize: 20,
            backgroundColor: Colors.purple,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "First"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Second"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded), label: "Third"),
            ]),

        // =========================================================

        drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Divyesh"),
                  accountEmail: Text("decode@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2017/11/03/18/26/man-2915187__340.jpg")),
                  currentAccountPictureSize: Size(70, 70),
                  otherAccountsPictures: [
                    CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2017/11/03/18/26/man-2915187__340.jpg")),
                    CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2017/11/03/18/26/man-2915187__340.jpg")),
                    CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2017/11/03/18/26/man-2915187__340.jpg")),
                  ],
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      cnt = 0;
                    });
                  },
                  leading: Icon(Icons.ac_unit_rounded),
                  title: Text("First"),
                  trailing: Icon(Icons.navigate_next),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      cnt = 1;
                    });
                  },
                  leading: Icon(Icons.photo),
                  title: Text("Second"),
                  trailing: Icon(Icons.navigate_next),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      cnt = 2;
                    });
                  },
                  leading: Icon(Icons.phone_in_talk_outlined),
                  title: Text("Third"),
                  trailing: Icon(Icons.navigate_next),
                )
              ],
            )),
        // body: l[cnt],

        body: TabBarView(children: [first(),second(),third()]),
    ));
  }
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.purple,
        child: Text(
          "FIRST PAGE",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.lightBlue,
        child: Text(
          "SECOND PAGE",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}

class third extends StatefulWidget {
  const third({Key? key}) : super(key: key);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.brown,
        child: Text(
          "THIRD PAGE",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
