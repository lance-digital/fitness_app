import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/user_info_model.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class MemberInfo extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  // ユーザーネーム
  String UserName = "";
  // 性別
  String Sex = "";
  // 身長
  String Height = "";
  // 体重
  String Weight = "";
  // メールアドレス
  String Email = "";
  // ベンチプレス最大重量
  String BenchPress = "";
  // デッドリフト最大重量
  String Deadlift = "";
  // スクワット最大重量
  String Squat = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue[400],
                      margin: EdgeInsets.only(top: 30, bottom: 30),
                      alignment: Alignment.center,
                      child: Container(
                        width: 150,
                        height: 30,
                        child: Text(
                          '会員情報',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Container(
                      width: 150,
                      height: 30,
                      child: Text(
                        'ユーザーネーム',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    child: StreamBuilder(
                      stream: _firestore.collection('users').where("uid", isEqualTo: uid).snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(

                            child: Text('取得できませんでした'),
                          );
                        }

                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Loading"),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> message =
                            document.data()! as Map<String, dynamic>;
                            return Card(
                              child: Text(
                                message['username'],
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Container(
                      width: 150,
                      height: 30,
                      child: Text(
                        '性　　別',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    child: StreamBuilder(
                      stream: _firestore.collection('users').where("uid", isEqualTo: uid).snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(

                            child: Text('取得できませんでした'),
                          );
                        }

                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Loading"),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> message =
                            document.data()! as Map<String, dynamic>;
                            return Card(
                              child: Text(
                                message['sex'],
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Container(
                      width: 150,
                      height: 30,
                      child: Text(
                        '身　　長',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    child: StreamBuilder(
                      stream: _firestore.collection('users').where("uid", isEqualTo: uid).snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(

                            child: Text('取得できませんでした'),
                          );
                        }

                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Loading"),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> message =
                            document.data()! as Map<String, dynamic>;
                            return Card(
                              child: Text(
                                message['height'],
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Container(
                      width: 150,
                      height: 30,
                      child: Text(
                        '体　　重',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    child: StreamBuilder(
                      stream: _firestore.collection('users').where("uid", isEqualTo: uid).snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(

                            child: Text('取得できませんでした'),
                          );
                        }

                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Loading"),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> message =
                            document.data()! as Map<String, dynamic>;
                            return Card(
                              child: Text(
                                message['weight'],
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Container(
                      width: 150,
                      height: 30,
                      child: Text(
                        'メールアドレス',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    child: StreamBuilder(
                      stream: _firestore.collection('users').where("uid", isEqualTo: uid).snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(

                            child: Text('取得できませんでした'),
                          );
                        }

                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Loading"),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> message =
                            document.data()! as Map<String, dynamic>;
                            return Card(
                              child: Text(
                                message['email'],
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue[400],
                      margin: EdgeInsets.only(top: 30, bottom: 30),
                      alignment: Alignment.center,
                      child: Container(
                        width: 150,
                        height: 30,
                        child: Text(
                          '最大重量',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Container(
                      width: 150,
                      height: 30,
                      child: Text(
                        'ベンチプレス',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    child: StreamBuilder(
                      stream: _firestore.collection('users').where("uid", isEqualTo: uid).snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(

                            child: Text('取得できませんでした'),
                          );
                        }

                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Loading"),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> message =
                            document.data()! as Map<String, dynamic>;
                            return Card(
                              child: Text(
                                message['bench'],
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Container(
                      width: 150,
                      height: 30,
                      child: Text(
                        'デッドリフト',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    child: StreamBuilder(
                      stream: _firestore.collection('users').where("uid", isEqualTo: uid).snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(

                            child: Text('取得できませんでした'),
                          );
                        }

                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Loading"),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> message =
                            document.data()! as Map<String, dynamic>;
                            return Card(
                              child: Text(
                                message['dead'],
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Container(
                      width: 150,
                      height: 30,
                      child: Text(
                        'スクワット',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    child: StreamBuilder(
                      stream: _firestore.collection('users').where("uid", isEqualTo: uid).snapshots(),
                      builder:
                          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(

                            child: Text('取得できませんでした'),
                          );
                        }

                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Loading"),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> message =
                            document.data()! as Map<String, dynamic>;
                            return Card(
                              child: Text(
                                message['squat'],
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 20),
                    child: ElevatedButton(
                      child: Text(
                        'ログアウト',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      onPressed: () async {
                        // ログアウト処理
                        // 内部で保持しているログイン情報等が初期化される
                        // （現時点ではログアウト時はこの処理を呼び出せばOKと、思うぐらいで大丈夫です）
                        await FirebaseAuth.instance.signOut();
                        // ログイン画面に遷移＋チャット画面を破棄
                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return Login();
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

