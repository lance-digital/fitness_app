import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/register.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class RegisterWeightRecord extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterWeightRecordPage(),
    );
  }
}

class RegisterWeightRecordPage extends StatefulWidget {
  @override
  RegisterWeightRecordPageState createState() => RegisterWeightRecordPageState();
}

class RegisterWeightRecordPageState extends State<RegisterWeightRecordPage> {
  RegisterPageState registerpagestate = RegisterPageState();

  // ベンチプレス最大重量
  String BenchPress = "";
  // デッドリフト最大重量
  String Deadlift = "";
  // スクワット最大重量
  String Squat = "";
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
                decoration: InputDecoration(labelText: "ベンチプレス最大重量"),
                onChanged: (String value) {
                  setState(() {
                    BenchPress = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: "デッドリフト最大重量"),
                onChanged: (String value) {
                  setState(() {
                    Deadlift = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: "スクワット最大重量"),
                onChanged: (String value) {
                  setState(() {
                    Squat = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  // メール/パスワードでユーザー登録
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final UserCredential result =
                  await auth.createUserWithEmailAndPassword(
                    email: registerpagestate.newUserEmail,
                    password: registerpagestate.newUserPassword,
                  );

                  // 登録したユーザー情報
                  final User user = result.user!;
                  final uid = user.uid;
                  final doc = FirebaseFirestore.instance.collection('users').doc(uid);

                  try {
                    setState(() {
                      infoText = "登録OK：${user.email}";
                    });
                    await doc.set({
                      'uid': uid,
                      'email': registerpagestate.newUserEmail,
                    });
                  } catch (e) {
                    // 登録に失敗した場合
                    setState(() {
                      infoText = "登録NG：${e.toString()}";
                    });
                  }
                },
                child: Text("ユーザー登録"),
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