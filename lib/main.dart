import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'calender.dart';
import 'chat.dart';
import 'home.dart';
import 'home_register_personal.dart';
import 'login.dart';
import 'member_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // スプラッシュ画面などに書き換えても良い
            return const SizedBox();
          }
          if (snapshot.hasData) {
            // User が null でなない、つまりサインイン済みのホーム画面へ
            return Screen();
          }
          // User が null である、つまり未サインインのサインイン画面へ
          return Login();
        },
      ),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Screen> {
  var _pages = <Widget>[
    Container(
      child: Home(),
    ),
    Container(
      child: Calender(),
    ),
    Container(
      child: Chat(),
    ),
    Container(
      child: MemberInfo(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("Item $index"),
            );
          },
        ),
      ),
      appBar: AppBar(
        title: Text("Lance筋トレ部"),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.settings), onPressed: () {  },
          ),
        ],
      ),
      body: PersistentTabView(
        context,
        screens: _pages, //表示する画面の設定
        items: [
          //タブ
          PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            title: "Home",
            activeColorPrimary: Colors.pink,
            inactiveColorPrimary: Colors.blue,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.calendar_month),
            title: "Colender",
            activeColorPrimary: Colors.pink,
            inactiveColorPrimary: Colors.blue,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.chat),
            title: "Chat",
            activeColorPrimary: Colors.pink,
            inactiveColorPrimary: Colors.blue,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.account_circle),
            title: "Account",
            activeColorPrimary: Colors.pink,
            inactiveColorPrimary: Colors.blue,
          ),
        ],
        navBarStyle: NavBarStyle.style6,
        decoration: NavBarDecoration(
          //枠線
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}