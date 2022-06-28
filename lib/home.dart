import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/training.dart';
import 'package:flutter/material.dart';

import 'home_register_personal.dart';

class Bench {
  String cnt;
  String set;

  Bench(this.cnt, this.set);
}

class Home extends StatelessWidget {
  List day = dayCount();

  late String bench_count = "";
  late String bench_set = "";

  Future<String> futureUsers() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    String username = "";
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      username = data['username'];
    });
    return username;
  }

  Future<String> futureBench() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    String bench = "";
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      bench = data['bench_' + day[data['day_count']]];
    });
    return bench;
  }

  Future<int> futureDay() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    int day = 0;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      day = data['day_count'];
    });
    return day;
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
                  child: FutureBuilder(
                    future: futureDay(),
                    builder: _buildChildDay,
                  )),
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
            Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Container(
                  child: FutureBuilder(
                    future: futureUsers(),
                    builder: _buildChild,
                  ),
                ),
                Container(
                  child: FutureBuilder(
                    future: futureBench(),
                    builder: _buildChildBench,
                  ),
                ),
              ]),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildChildDay(BuildContext context, AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasData) {
      int? day2 = snapshot.data as int?;
      String day3 = (day2! + 1).toString();

      bench_count = benchMenu(day2).cnt;
      bench_set = benchMenu(day2).set;

      return Text("day" + day3, style: TextStyle(fontSize: 20));
    }
    else {
      // データが確定しない場合に表示するウィジェットの作成処理
      return Text("hoge");
    }
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
                height: 65,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 280,
                      height: 30,
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
                      width: 280,
                      height: 35,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 280,
                            height: 35,
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
      return Text("");
    }
  }

  Widget _buildChildBench(BuildContext context, AsyncSnapshot<Object?> snapshot) {
    String? Weight = snapshot.data as String?;
    if (snapshot.hasData) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
            child: Container(
              width: 280,
              height: 35,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 280,
                    height: 35,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 80,
                          height: 35,
                          margin: EdgeInsets.only(top: 4),
                          child: Text(
                            Weight! + "kg",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 35,
                          margin: EdgeInsets.only(top: 4),
                          child: Text(
                            '×',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 35,
                          child: Text(
                            bench_count,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 35,
                          margin: EdgeInsets.only(top: 4),
                          child: Text(
                            '×',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 35,
                          child: Text(
                            bench_set,
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
        ],
      );
    }
    else {
      // データが確定しない場合に表示するウィジェットの作成処理
      return Text("");
    }
  }
}

List dayCount() {
  List day = [];
  for (var i = 1; i < 43; i++){
    day.add("day" + i.toString());
  }
  return day;
}

Bench benchMenu(int day_count) {
  String bench_count = "";
  String bench_set = "";

  switch (day_count + 1) {
    case 1:
    case 8:
    case 15:
    case 22:
    case 29:
    case 36:
      bench_count = "8回";
      bench_set = "5セット";
      break;
    case 3:
    case 10:
    case 17:
    case 24:
    case 31:
    case 38:
      bench_count = "1回";
      bench_set = "5セット";
      break;
    case 5:
    case 12:
    case 19:
    case 26:
    case 33:
    case 40:
      bench_count = "限界";
      bench_set = "5セット";
      break;
  }
  Bench bench = new Bench(bench_count, bench_set);

  return bench;
}
