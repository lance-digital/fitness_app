import 'package:flutter/material.dart';
import 'package:fitness_app/clock.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                width: 350,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      alignment: Alignment.center,
                      child: Image.asset('images/squat.png'),
                    ),
                  ],
                ),
              ),    //child: Text('トレーニング1', style: TextStyle(fontSize: 20))),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[ //child: Text('トレーニング1', style: TextStyle(fontSize: 20))),
              Container(
                child: SetTimer(),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}