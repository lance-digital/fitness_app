import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          //ステップ２
          child: StreamBuilder(
            stream: _firestore.collection('training').snapshots(),
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
                    child: ListTile(
                      title: Text(message['menu']),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}

