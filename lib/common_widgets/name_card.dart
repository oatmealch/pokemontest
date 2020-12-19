import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NameCard extends StatelessWidget {
  void _launchURL(urlPath) async {
    if (await canLaunch(urlPath)) {
      await launch(urlPath);
    } else {
      throw 'Could not launch $urlPath';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: SizedBox(
        width: 500,
        height: 300,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          child: Container(
            decoration: BoxDecoration(color: Colors.brown[50]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.brown),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.0),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('개발자',
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.0,
                                fontSize: 24)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Image.asset('assets/images/profile.png',
                                  scale: 1.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text('종합게임 스트리머 .',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NotoSansKR'),
                                      textAlign: TextAlign.left),
                                  Text('예비 개발자 .',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NotoSansKR'),
                                      textAlign: TextAlign.left),
                                  Text('oatmealch@gmail.com',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NotoSansKR'),
                                      textAlign: TextAlign.left),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.brown[50]),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: RaisedButton(
                              elevation: 0,
                              color: Colors.orange,
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/icons/icon-blogger.png',
                                  scale: 1.5,
                                ),
                              )),
                              onPressed: () => _launchURL(
                                  'https://oatmealch.blogspot.com/'))),
                      Flexible(
                          flex: 1,
                          child: RaisedButton(
                              elevation: 0,
                              color: Colors.red,
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/icons/icon-youtube.png',
                                  scale: 1.5,
                                ),
                              )),
                              onPressed: () => _launchURL(
                                  'https://www.youtube.com/channel/UC9Dprrn26PVQn1XIuLo-S4A'))),
                      Flexible(
                          flex: 1,
                          child: RaisedButton(
                              elevation: 0,
                              color: Colors.deepPurple[600],
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/icons/icon-twitch.png',
                                  scale: 1.5,
                                ),
                              )),
                              onPressed: () => _launchURL(
                                  'https://www.twitch.tv/oatmealch'))),
                      Flexible(
                          flex: 1,
                          child: RaisedButton(
                              elevation: 0,
                              color: Colors.blue,
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  'assets/icons/icon-twitter.png',
                                  scale: 1.5,
                                ),
                              )),
                              onPressed: () => _launchURL(
                                  'https://twitter.com/oatmeal_vgc'))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
