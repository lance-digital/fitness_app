import 'package:flutter/material.dart';

import 'chat.dart';

class MessageWidget extends StatelessWidget {
  //const MessageWidget({
    //Key key,
  //}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
              return Chat();
            }));
          },
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          leading: ClipOval(
              child: Image.asset('images/kokubo.png')
          ),
          trailing: Text('20分前'),
          title: Text('ベンチプレスのやり方がわかりません'),
          subtitle: Text('小久保'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          leading: ClipOval(
              child: Image.asset('images/mother.png')
          ),
          trailing: Text('15分前'),
          title: Text('気合'),
          subtitle: Text('トレーナー'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          leading: ClipOval(
              child: Image.asset('images/kokubo.png')
          ),
          trailing: Text('3分前'),
          title: Text('ありがとうございます'),
          subtitle: Text('小久保'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          leading: ClipOval(
              child: Image.asset('images/mother.png')
          ),
          trailing: Text('1分前'),
          title: Text('ファイト！'),
          subtitle: Text('トレーナー'),
        ),
      ],
    );
  }
}