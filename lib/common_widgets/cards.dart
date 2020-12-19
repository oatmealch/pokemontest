import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key key,
    @required this.isMain,
    @required this.cardHeight,
    @required this.cardWidth,
    @required this.cardTitle,
    @required this.cardSubTitle,
    @required this.cardText01,
    @required this.cardText02,
    @required this.cardText03,
    @required this.imagePath,
    @required this.imageHeight,
    @required this.titleColor,
    this.idResultAsMap,
  }) : super(key: key);
  final double cardWidth, cardHeight;
  final String cardTitle, cardSubTitle, cardText01, cardText02, cardText03;
  final bool isMain;
  final List idResultAsMap;
  final String imagePath;
  final double imageHeight;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    final double lineSpacing = 1.5;
    final double indicatorDiameter = 110;
    final double indicatorStroke = 15;
    final Color highColor = Colors.blue;
    final Color lowColor = Colors.greenAccent[700];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
      child: SizedBox(
        width: cardWidth,
        height: cardHeight,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          child: Column(children: [
            Container(
              decoration: BoxDecoration(color: titleColor),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(cardTitle,
                      style: TextStyle(
                          color: Colors.white,
                          height: 1.0,
                          fontSize: cardTitle == '' ? 0 : 22)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(cardSubTitle,
                      style: TextStyle(fontSize: cardSubTitle == '' ? 0 : 24)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Image.asset(
                    imagePath,
                    height: imageHeight,
                  ),
                ),
                isMain
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: SizedBox(
                          width: indicatorDiameter * 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularPercentIndicator(
                                radius: indicatorDiameter,
                                lineWidth: indicatorStroke,
                                progressColor: idResultAsMap[0] == 0
                                    ? highColor
                                    : lowColor,
                                percent: (idResultAsMap[0] + 3) / 5,
                                center:
                                    Text('숙련도', style: TextStyle(fontSize: 20)),
                              ),
                              CircularPercentIndicator(
                                radius: indicatorDiameter,
                                lineWidth: indicatorStroke,
                                progressColor: idResultAsMap[1] == 0
                                    ? highColor
                                    : lowColor,
                                percent: (idResultAsMap[1] + 3) / 5,
                                center:
                                    Text('승부욕', style: TextStyle(fontSize: 20)),
                              ),
                              CircularPercentIndicator(
                                radius: indicatorDiameter,
                                lineWidth: indicatorStroke,
                                progressColor: idResultAsMap[2] == 0
                                    ? highColor
                                    : lowColor,
                                percent: (idResultAsMap[2] + 3) / 5,
                                center:
                                    Text('자신감', style: TextStyle(fontSize: 20)),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  width: cardWidth * 0.8,
                  child: Column(children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
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
                    Container(
                      child: cardText02 == ""
                          ? null
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 8.0),
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
                    ),
                    Container(
                      child: cardText03 == ""
                          ? null
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 8.0),
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
                    )
                  ]),
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
