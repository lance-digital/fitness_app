import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/member_info.dart';
import 'package:fitness_app/training.dart';
import 'package:flutter/material.dart';

import 'home_register_personal.dart';

class Home extends StatelessWidget {
  Future<String> future1() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    String a = "";
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      a = data['username'];
    });
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 15, left: 20),
                  child: Text('プラン', style: TextStyle(fontSize: 20))),
              Container(
                  margin: EdgeInsets.only(top: 15, left: 85),
                  child: Text('day1', style: TextStyle(fontSize: 20))),
            ]),
            Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Expanded(
                child: Container(
                    color: Colors.blue[400],
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Text('本日のメニュー', style: TextStyle(fontSize: 20))),
              ),
            ]),
            Container(
              child: FutureBuilder(
                future: future1(),
                builder: _buildChild,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChild(BuildContext context, AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasData) {
      if (snapshot.data == "") {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 100),
              alignment: Alignment.center,
              child: Text('トレーニングの前に、', style: TextStyle(fontSize: 23))),
          Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text('パーソナル情報を登録してください', style: TextStyle(fontSize: 23))),
          TextButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeRegisterPersonal()),
              );
            },
            child: Text("パーソナル情報登録", style: TextStyle(fontSize: 23)),
          ),
        ]);
      }
      return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
              child: Container(
                width: 280,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFF47171),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 280,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFFF47171),
                      ),
                      child: Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          'トレーニング1',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color(0xFFF47171),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 280,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFF47171),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, 4, 0, 0),
                              child: Text(
                                'ベンチプレス',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 280,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color(0xFFF47171),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 80,
                            height: 100,
                            margin: EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              color: Color(0xFFF47171),
                            ),
                            child: Text(
                              '80kg',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 100,
                            margin: EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              color: Color(0xFFF47171),
                            ),
                            child: Text(
                              '×',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFF47171),
                            ),
                            child: Text(
                              '8回',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 100,
                            margin: EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              color: Color(0xFFF47171),
                            ),
                            child: Text(
                              '×',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFF47171),
                            ),
                            child: Text(
                              '5セット',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: ElevatedButton(
                child: Text(
                  'start',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TrainingScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
    else {
      // データが確定しない場合に表示するウィジェットの作成処理
      return Text("hoge");
    }
  }
}

