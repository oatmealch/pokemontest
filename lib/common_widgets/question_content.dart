import 'package:flutter/material.dart';

class QuestionContent extends StatelessWidget {
  const QuestionContent({
    Key key,
    @required this.currentQuestionData,
    @required this.questionNumber,
  }) : super(key: key);

  final List<dynamic> currentQuestionData;
  final int questionNumber;

  @override
  Widget build(BuildContext context) {
    final double textLinceSpace = 10;
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width < 1200
          ? screenSize.width * 0.9
          : screenSize.width * 0.7,
      height: screenSize.height * 0.55,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: textLinceSpace),
              child: currentQuestionData[1] == ''
                  ? null
                  : SizedBox(
                      width: double.infinity,
                      child: Text(
                        currentQuestionData[1],
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontFamily: 'NotoSansKR', fontSize: 18),
                      )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: textLinceSpace),
              child: currentQuestionData[2] == ''
                  ? null
                  : SizedBox(
                      width: double.infinity,
                      child: Text(
                        currentQuestionData[2],
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontFamily: 'NotoSansKR', fontSize: 18),
                      )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: textLinceSpace),
              child: currentQuestionData[3] == ''
                  ? null
                  : SizedBox(
                      width: double.infinity,
                      child: Text(
                        currentQuestionData[3],
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontFamily: 'NotoSansKR', fontSize: 18),
                      )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: textLinceSpace),
              child: currentQuestionData[4] == ''
                  ? null
                  : SizedBox(
                      width: double.infinity,
                      child: Text(
                        currentQuestionData[4],
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontFamily: 'NotoSansKR', fontSize: 18),
                      )),
            ),
            currentQuestionData[5] != ''
                ? Image.asset(
                    'assets/images/question-' +
                        questionNumber.toString() +
                        '.jpg',
                    fit: BoxFit.contain,
                    width: screenSize.width > 1200
                        ? screenSize.width * 0.3
                        : screenSize.width * 0.9,
                    height: screenSize.width > 1200
                        ? screenSize.width * 0.2
                        : screenSize.width * 0.6,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
