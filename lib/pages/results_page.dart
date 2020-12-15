import 'package:flutter/material.dart';
import 'package:pokemon_test/common_widgets/cards.dart';
import 'package:pokemon_test/common_widgets/raised_buttons.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key key,
    @required this.idResultAsMap,
    @required this.currentResultData,
  }) : super(key: key);

  final List<dynamic> currentResultData;
  final List idResultAsMap;

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
                flex: 15,
                child: Column(
                  children: [
                    Flexible(
                      flex: 10,
                      child: ListView(
                        children: [
                          SizedBox(height: sentenceLineSpacing),
                          CustomCard(
                            isMain: true,
                            idResultAsMap: idResultAsMap,
                            cardTitle: currentResultData[1],
                            cardSubTitle: '',
                            cardText01: currentResultData[2],
                            cardText02: currentResultData[3],
                            cardText03: currentResultData[4],
                          ),
                          SizedBox(height: sentenceLineSpacing),
                          CustomCard(
                              isMain: false,
                              cardTitle: '나에게 손쉬운 상대',
                              cardSubTitle: currentResultData[5],
                              cardText01: currentResultData[6],
                              cardText02: '',
                              cardText03: ''),
                          SizedBox(height: sentenceLineSpacing),
                          CustomCard(
                              isMain: false,
                              cardTitle: '상대하기 어려운 유형',
                              cardSubTitle: currentResultData[7],
                              cardText01: currentResultData[8],
                              cardText02: '',
                              cardText03: ''),
                          SizedBox(height: sentenceLineSpacing),
                          CustomCard(
                              isMain: false,
                              cardTitle: '',
                              cardSubTitle: '개발자 소개',
                              cardText01: '오트밀_',
                              cardText02: '종합게임 스트리머 겸 예비개발자입니다.',
                              cardText03: ''),
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
