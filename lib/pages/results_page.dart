import 'package:flutter/material.dart';
import 'package:pokemon_test/common_widgets/cards.dart';
import 'package:pokemon_test/common_widgets/raised_buttons.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key key,
    @required this.idResultAsMap,
    @required this.currentResultData,
    @required this.codeResult,
  }) : super(key: key);

  final List<dynamic> currentResultData;
  final List idResultAsMap;
  final codeResult;

  @override
  Widget build(BuildContext context) {
    double sentenceLineSpacing = 10;

    void _shareResult() {}

    return Scaffold(
        appBar: AppBar(
          title: Text('테스트 결과',
              style: TextStyle(
                  fontFamily: 'NotoSansKR', fontWeight: FontWeight.w700)),
        ),
        body: Container(
          color: Colors.grey[200],
          child: Row(
            children: [
              Flexible(flex: 1, child: Container()),
              Flexible(
                flex: 16,
                child: Column(
                  children: [
                    Flexible(
                      flex: 8,
                      child: ListView(
                        children: [
                          SizedBox(height: sentenceLineSpacing),
                          CustomCard(
                            isMain: true,
                            idResultAsMap: idResultAsMap,
                            cardTitle: '나의 실전배틀 유형',
                            titleColor: Colors.red,
                            cardSubTitle: currentResultData[1],
                            imagePath: 'assets/images/resultFull0' +
                                codeResult.toString() +
                                '.png',
                            imageScale: 1,
                            cardText01: currentResultData[2],
                            cardText02: currentResultData[3],
                            cardText03: currentResultData[4],
                          ),
                          SizedBox(height: sentenceLineSpacing),
                          CustomCard(
                              isMain: false,
                              cardTitle: '상대하기 쉬운 유형',
                              titleColor: Colors.blue[600],
                              cardSubTitle: currentResultData[5],
                              imagePath: '',
                              imageScale: 1,
                              cardText01: currentResultData[6],
                              cardText02: '',
                              cardText03: ''),
                          SizedBox(height: sentenceLineSpacing),
                          CustomCard(
                              isMain: false,
                              cardTitle: '상대하기 어려운 유형',
                              titleColor: Colors.grey[800],
                              cardSubTitle: currentResultData[7],
                              imagePath: '',
                              imageScale: 1,
                              cardText01: currentResultData[8],
                              cardText02: '',
                              cardText03: ''),
                          SizedBox(height: sentenceLineSpacing),
                          Card(
                            elevation: 6,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.red),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "아래의 공유하기 버튼을 눌러 결과를 공유해보세요~",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: sentenceLineSpacing),
                          NameCard(),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: CustomRaisedButton(
                          buttonWidth: 150,
                          buttonColor: Colors.red,
                          buttonFontSize: 24,
                          buttonHeight: 50,
                          buttonText: '결과 공유',
                          textColor: Colors.white,
                          buttonTextPadding: 3,
                          onPressed: _shareResult,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(flex: 1, child: Container()),
            ],
          ),
        ));
  }
}
