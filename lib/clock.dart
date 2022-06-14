import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'dart:async';

class SetTimer extends StatefulWidget { // 状態を持ちたいので StatefulWidget を継承
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<SetTimer> {
  late Timer _timer; // この辺が状態
  late DateTime _time;
  int set = 1; // set数
  int seconds = 60; //60秒でTimerストップ

  @override
  void initState() { // 初期化処理
    _time = DateTime.utc(0, 0, 0, 0, 1, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) { // setState() の度に実行1
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[ //child: Text('トレーニング1', style: TextStyle(fontSize: 20))),
            Container(
              color: Colors.red[100],
              child: _setText(set),
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: ElevatedButton(
                child: Text(
                  'Finish',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () { // Finishボタンタップ時の処理
                  _timer = Timer.periodic(
                    Duration(seconds: 1), // 1秒毎に定期実行
                        (Timer timer) {
                      setState(() { // 変更を画面に反映するため、setState()している
                        //_time = _time.add(Duration(seconds: 1));
                        _time = DateTime.utc(0, 0, 0, 0, 0, seconds);
                        seconds--;
                        if (seconds == -1) {
                          FlutterRingtonePlayer.playNotification(
                            volume: 0.1,
                          );
                          set = set + 1;
                          seconds = 60;
                          _time = DateTime.utc(0, 0, 0, 0, 1, 0);
                          _timer.cancel();
                          if (set == 5) {
                            Navigator.pop(context);
                          }
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ]),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              DateFormat.ms().format(_time),
              style: Theme.of(context).textTheme.headline2,
            ),
          )
        ])
    );
  }
}

Widget _setText(int set) {
  if (set == 1) {
    return Text('セット1', style: TextStyle(fontSize:40));
  } else if (set == 2) {
    return Text('セット2', style: TextStyle(fontSize:40));
  } else if (set == 3) {
    return Text('セット3', style: TextStyle(fontSize:40));
  } else if (set == 4) {
    return Text('セット4', style: TextStyle(fontSize:40));
  } else {
    return Text('セット5', style: TextStyle(fontSize:40));
  }
}