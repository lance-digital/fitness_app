import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/home.dart';
import 'package:flutter/material.dart';

import 'home_register_personal.dart';
import 'login.dart';

class HomeRegisterWeightRecord extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeRegisterWeightRecordPage(),
    );
  }
}

class HomeRegisterWeightRecordPage extends StatefulWidget {
  @override
  HomeRegisterWeightRecordPageState createState() => HomeRegisterWeightRecordPageState();
}

class HomeRegisterWeightRecordPageState extends State<HomeRegisterWeightRecordPage> {
  final doc = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);

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
      body: SingleChildScrollView(
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
                  await doc.update({
                    'bench': BenchPress,
                    'dead': Deadlift,
                    'squat': Squat,
                    'bench_day1': int.parse(BenchPress) * 0.75,
                    'bench_day2': "",
                    'bench_day3': int.parse(BenchPress) * 0.80,
                    'bench_day4': "",
                    'bench_day5': int.parse(BenchPress) * 0.85,
                    'bench_day6': "",
                    'bench_day7': "",
                    'bench_day8': int.parse(BenchPress) * 0.75,
                    'bench_day9': "",
                    'bench_day10': int.parse(BenchPress) * 0.80,
                    'bench_day11': "",
                    'bench_day12': int.parse(BenchPress) * 0.875,
                    'bench_day13': "",
                    'bench_day14': "",
                    'bench_day15': int.parse(BenchPress) * 0.75,
                    'bench_day16': "",
                    'bench_day17': int.parse(BenchPress) * 0.85,
                    'bench_day18': "",
                    'bench_day19': int.parse(BenchPress) * 0.90,
                    'bench_day20': "",
                    'bench_day21': "",
                    'bench_day22': int.parse(BenchPress) * 0.75,
                    'bench_day23': "",
                    'bench_day24': int.parse(BenchPress) * 0.85,
                    'bench_day25': "",
                    'bench_day26': int.parse(BenchPress) * 0.90,
                    'bench_day27': "",
                    'bench_day28': "",
                    'bench_day29': int.parse(BenchPress) * 0.75,
                    'bench_day30': "",
                    'bench_day31': int.parse(BenchPress) * 0.90,
                    'bench_day32': "",
                    'bench_day33': int.parse(BenchPress) * 0.925,
                    'bench_day34': "",
                    'bench_day35': "",
                    'bench_day36': int.parse(BenchPress) * 0.75,
                    'bench_day37': "",
                    'bench_day38': int.parse(BenchPress) * 0.90,
                    'bench_day39': "",
                    'bench_day40': int.parse(BenchPress) * 0.95,
                    'dead_day1': "",
                    'dead_day2': int.parse(BenchPress) * 0.75,
                    'dead_day3': "",
                    'dead_day4': int.parse(BenchPress) * 0.80,
                    'dead_day5': "",
                    'dead_day6': int.parse(BenchPress) * 0.85,
                    'dead_day7': "",
                    'dead_day8': "",
                    'dead_day9': int.parse(BenchPress) * 0.75,
                    'dead_day10': "",
                    'dead_day11': int.parse(BenchPress) * 0.80,
                    'dead_day12': "",
                    'dead_day13': int.parse(BenchPress) * 0.875,
                    'dead_day14': "",
                    'dead_day15': "",
                    'dead_day16': int.parse(BenchPress) * 0.75,
                    'dead_day17': "",
                    'dead_day18': int.parse(BenchPress) * 0.85,
                    'dead_day19': "",
                    'dead_day20': int.parse(BenchPress) * 0.90,
                    'dead_day21': "",
                    'dead_day22': "",
                    'dead_day23': int.parse(BenchPress) * 0.75,
                    'dead_day24': "",
                    'dead_day25': int.parse(BenchPress) * 0.85,
                    'dead_day26': "",
                    'dead_day27': int.parse(BenchPress) * 0.90,
                    'dead_day28': "",
                    'dead_day29': "",
                    'dead_day30': int.parse(BenchPress) * 0.75,
                    'dead_day31': "",
                    'dead_day32': int.parse(BenchPress) * 0.90,
                    'dead_day33': "",
                    'dead_day34': int.parse(BenchPress) * 0.925,
                    'dead_day35': "",
                    'dead_day36': "",
                    'dead_day37': int.parse(BenchPress) * 0.75,
                    'dead_day38': "",
                    'dead_day39': int.parse(BenchPress) * 0.90,
                    'dead_day40': "",
                    'dead_day41': int.parse(BenchPress) * 0.95,
                    'squat_day1': "",
                    'squat_day2': int.parse(BenchPress) * 0.75,
                    'squat_day3': "",
                    'squat_day4': int.parse(BenchPress) * 0.80,
                    'squat_day5': "",
                    'squat_day6': int.parse(BenchPress) * 0.85,
                    'squat_day7': "",
                    'squat_day8': "",
                    'squat_day9': int.parse(BenchPress) * 0.75,
                    'squat_day10': "",
                    'squat_day11': int.parse(BenchPress) * 0.80,
                    'squat_day12': "",
                    'squat_day13': int.parse(BenchPress) * 0.875,
                    'squat_day14': "",
                    'squat_day15': "",
                    'squat_day16': int.parse(BenchPress) * 0.75,
                    'squat_day17': "",
                    'squat_day18': int.parse(BenchPress) * 0.85,
                    'squat_day19': "",
                    'squat_day20': int.parse(BenchPress) * 0.90,
                    'squat_day21': "",
                    'squat_day22': "",
                    'squat_day23': int.parse(BenchPress) * 0.75,
                    'squat_day24': "",
                    'squat_day25': int.parse(BenchPress) * 0.85,
                    'squat_day26': "",
                    'squat_day27': int.parse(BenchPress) * 0.90,
                    'squat_day28': "",
                    'squat_day29': "",
                    'squat_day30': int.parse(BenchPress) * 0.75,
                    'squat_day31': "",
                    'squat_day32': int.parse(BenchPress) * 0.90,
                    'squat_day33': "",
                    'squat_day34': int.parse(BenchPress) * 0.925,
                    'squat_day35': "",
                    'squat_day36': "",
                    'squat_day37': int.parse(BenchPress) * 0.75,
                    'squat_day38': "",
                    'squat_day39': int.parse(BenchPress) * 0.90,
                    'squat_day40': "",
                    'squat_day41': int.parse(BenchPress) * 0.95,
                  });
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text("パーソナル情報登録"),
              ),
              TextButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeRegisterPersonal()),
                  );
                },
                child: Text("戻る"),
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