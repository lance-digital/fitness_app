import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/register.dart';
import 'package:fitness_app/register_weight_record.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class RegisterPersonal extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterPersonalPage(),
    );
  }
}

class RegisterPersonalPage extends StatefulWidget {
  @override
  RegisterPersonalPageState createState() => RegisterPersonalPageState();
}

class RegisterPersonalPageState extends State<RegisterPersonalPage> {
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
      appBar: AppBar(
        centerTitle: true,
        title: Text("新規登録画面"),
      ),
      body: Center(
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
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterWeightRecord()),
                  );
                },
                child: Text("次へ"),
              ),
              TextButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text("ログイン画面"),
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