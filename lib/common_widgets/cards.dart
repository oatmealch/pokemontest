import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key key,
    @required this.isMain,
    @required this.cardTitle,
    @required this.cardSubTitle,
    @required this.cardText01,
    @required this.cardText02,
    @required this.cardText03,
    @required this.imagePath,
    @required this.imageScale,
    @required this.titleColor,
    this.idResultAsMap,
  }) : super(key: key);
  final String cardTitle, cardSubTitle, cardText01, cardText02, cardText03;
  final bool isMain;
  final List idResultAsMap;
  final String imagePath;
  final double imageScale;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    final double lineSpacing = 1.5;
    final double indicatorDiameter = 110;
    final double indicatorStroke = 15;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: titleColor),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(cardTitle,
                    style: TextStyle(
                        color: Colors.white,
                        height: 1.0,
                        fontSize: cardTitle == '' ? 0 : 24)),
              ),
            ),
          ),
          Container(
            child: SizedBox(
              width: 1000,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(cardSubTitle,
                          style:
                              TextStyle(fontSize: cardSubTitle == '' ? 0 : 22)),
                    ),
                    Image.asset(imagePath, scale: 1),
                    isMain
                        ? SizedBox(
                            width: indicatorDiameter * 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircularPercentIndicator(
                                  radius: indicatorDiameter,
                                  lineWidth: indicatorStroke,
                                  progressColor: idResultAsMap[0] == 0
                                      ? Colors.amber[700]
                                      : Colors.green,
                                  percent: (idResultAsMap[0] + 3) / 5,
                                  center: Text('숙련도',
                                      style: TextStyle(fontSize: 20)),
                                ),
                                CircularPercentIndicator(
                                  radius: indicatorDiameter,
                                  lineWidth: indicatorStroke,
                                  progressColor: idResultAsMap[1] == 0
                                      ? Colors.amber[700]
                                      : Colors.green,
                                  percent: (idResultAsMap[1] + 3) / 5,
                                  center: Text('승부욕',
                                      style: TextStyle(fontSize: 20)),
                                ),
                                CircularPercentIndicator(
                                  radius: indicatorDiameter,
                                  lineWidth: indicatorStroke,
                                  progressColor: idResultAsMap[2] == 0
                                      ? Colors.amber[700]
                                      : Colors.green,
                                  percent: (idResultAsMap[2] + 3) / 5,
                                  center: Text('자신감',
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(cardText01,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'NotoSansKR',
                                height: lineSpacing)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(cardText02,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'NotoSansKR',
                                height: lineSpacing)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(cardText03,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'NotoSansKR',
                                height: lineSpacing)),
                      ),
                    ),
                    cardText03 == '' ? Container() : SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.brown),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Text('개발자',
                      style: TextStyle(
                          color: Colors.white, height: 1.0, fontSize: 20)),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.brown[50]),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Image.asset('assets/images/profile.png',
                              scale: 1.0),
                          // child: Placeholder(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text('종합게임 스트리머',
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'NotoSansKR'),
                                  textAlign: TextAlign.left),
                              Text('예비 개발자',
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'NotoSansKR'),
                                  textAlign: TextAlign.left),
                              Text('oatmealch@gmail.com',
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'NotoSansKR'),
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
                          color: Colors.red,
                          child: Center(
                              child: Text(
                            '▶',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                          onPressed: () => _launchURL(
                              'https://www.youtube.com/channel/UC9Dprrn26PVQn1XIuLo-S4A'))),
                  Flexible(
                      flex: 1,
                      child: RaisedButton(
                          elevation: 0,
                          color: Colors.deepPurple[600],
                          child: Center(
                              child: Image.asset(
                            'assets/icons/icon-twitch.png',
                            scale: 1,
                          )),
                          onPressed: () =>
                              _launchURL('https://www.twitch.tv/oatmealch'))),
                  Flexible(
                      flex: 1,
                      child: RaisedButton(
                          elevation: 0,
                          color: Colors.blue,
                          child: Center(
                              child: Image.asset(
                            'assets/icons/icon-twitter.png',
                            scale: 1,
                          )),
                          onPressed: () =>
                              _launchURL('https://twitter.com/oatmeal_vgc')))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
