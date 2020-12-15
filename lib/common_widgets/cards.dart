import 'package:flutter/material.dart';
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
    this.idResultAsMap,
  }) : super(key: key);
  final String cardTitle, cardSubTitle, cardText01, cardText02, cardText03;
  final bool isMain;
  final List idResultAsMap;

  @override
  Widget build(BuildContext context) {
    final double lineSpacing = 1.5;
    final double indicatorDiameter = 110;
    final double indicatorStroke = 20;
    List factorText = ['높음', '보통'];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: SizedBox(
        width: 1000,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Text(cardTitle,
                  style: TextStyle(
                      height: 1.0, fontSize: cardTitle == '' ? 0 : 28)),
              cardTitle == '' ? Container() : SizedBox(height: 10),
              Text(cardSubTitle,
                  style: TextStyle(fontSize: cardSubTitle == '' ? 0 : 24)),
              cardSubTitle == '' ? Container() : SizedBox(height: 10),
              SizedBox(width: 300, height: 200, child: Placeholder()),
              isMain
                  ? SizedBox(
                      width: indicatorDiameter * 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircularPercentIndicator(
                            radius: indicatorDiameter,
                            lineWidth: indicatorStroke,
                            progressColor: idResultAsMap[0] == 0
                                ? Colors.blue
                                : Colors.red,
                            percent: (idResultAsMap[0] + 3) / 5,
                            center: Text('숙련도', style: TextStyle(fontSize: 20)),
                          ),
                          CircularPercentIndicator(
                            radius: indicatorDiameter,
                            lineWidth: indicatorStroke,
                            progressColor: idResultAsMap[1] == 0
                                ? Colors.blue
                                : Colors.red,
                            percent: (idResultAsMap[1] + 3) / 5,
                            center: Text('승부욕', style: TextStyle(fontSize: 20)),
                          ),
                          CircularPercentIndicator(
                            radius: indicatorDiameter,
                            lineWidth: indicatorStroke,
                            progressColor: idResultAsMap[2] == 0
                                ? Colors.blue
                                : Colors.red,
                            percent: (idResultAsMap[2] + 3) / 5,
                            center: Text('자신감', style: TextStyle(fontSize: 20)),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              cardText01 == '' ? Container() : SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Text(cardText01,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        height: lineSpacing)),
              ),
              cardText01 == '' ? Container() : SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Text(cardText02,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        height: lineSpacing)),
              ),
              cardText02 == '' ? Container() : SizedBox(height: 10),
              // SizedBox(height: cardText02 == '' ? 0 : 10),
              SizedBox(
                width: double.infinity,
                child: Text(cardText03,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        height: lineSpacing)),
              ),
              cardText03 == '' ? Container() : SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
