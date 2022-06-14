import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_register_weight.dart';

class HomeRegisterPersonal extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeRegisterPersonalPage(),
    );
  }
}

class HomeRegisterPersonalPage extends StatefulWidget {
  @override
  HomeRegisterPersonalPageState createState() => HomeRegisterPersonalPageState();
}

class HomeRegisterPersonalPageState extends State<HomeRegisterPersonalPage> {
  //final uid = FirebaseAuth.instance.currentUser!.uid;
  final doc = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);

  // ユーザーネーム
  String UserName = "";
  // 性別
  String Sex = "";
  // 身長
  String Height = "";
  // 体重
  String Weight = "";
  // 登録に関する情報を表示
  String infoText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "ユーザーネーム"),
                onChanged: (String value) {
                  setState(() {
                    UserName = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: "性別"),
                onChanged: (String value) {
                  setState(() {
                    Sex = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: "身長"),
                onChanged: (String value) {
                  setState(() {
                    Height = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: "体重"),
                onChanged: (String value) {
                  setState(() {
                    Weight = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  await doc.update({
                    'username': UserName,
                    'sex': Sex,
                    'height': Height,
                    'weight': Weight,
                  });
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeRegisterWeightRecord()),
                  );
                },
                child: Text("次へ"),
              ),
              const SizedBox(height: 8),
              Text(infoText),
            ],
          ),
        ),
      ),
    );
  }
}