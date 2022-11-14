import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

// ignore: must_be_immutable
class EndRoutPage extends StatelessWidget {
  late AudioPlayer _player;

  @override
  Widget build(BuildContext context) {
    _startPlayer();

    return Scaffold(
      appBar: AppBar(
        title: Text('CalisthAnyWhere'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 56.0),
                child: Text(
                  'Well done!',
                  style: TextStyle(
                      fontSize: 42.0,
                      color: Color(0xFFFFB41F),
                      fontFamily: 'sans-serif-medium'),
                )),
            SizedBox(
              height: 5.0,
            ),
            Image(
              image: AssetImage('assets/images/well_done.png'),
              width: 238.0,
              height: 138.0,
            ),
            Image(
              image: AssetImage('assets/images/well_donestr.png'),
              width: 233.0,
              height: 112.0,
            ),
            Container(
                width: 440.0,
                margin: EdgeInsets.symmetric(horizontal: 7.0),
                padding: EdgeInsets.only(top: 80.0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  color: const Color(0xFF0E0E0E),
                  textColor: const Color(0xFFE0E0E6),
                  onPressed: () {
                    _stopPlayer();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Finish',
                    style: TextStyle(fontSize: 19.0),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // void _startPlayer() async {
  //   _player = await _cache.play('mcrowave_ready.mp3');
  // }

  void _startPlayer() async {
    _player = AudioPlayer();
    await _player.setAsset('assets/audio/mcrowave_ready.mp3');
    _player.play();
  }

  void dispose() {
    _player.stop();
    _stopPlayer();
  }

  void _stopPlayer() {
    _player.stop();
  }
}
