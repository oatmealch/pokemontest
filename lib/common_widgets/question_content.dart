import 'package:flutter/material.dart';
import '../common_widgets/images_network.dart';

class QuestionContent extends StatelessWidget {
  const QuestionContent({
    Key key,
    @required this.currentQuestionData,
    @required this.questionNumber,
    @required this.questionScrollController,
  }) : super(key: key);

  final List<dynamic> currentQuestionData;
  final int questionNumber;
  final ScrollController questionScrollController;

  @override
  Widget build(BuildContext context) {
    final double textLinceSpace = 10;
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width > 1200
          ? screenSize.width * 0.45
          : screenSize.width * 0.85,
      height: screenSize.width > 1200
          ? screenSize.height * 0.55
          : screenSize.height * 0.5,
      child: SingleChildScrollView(
        controller: questionScrollController,
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
            ),
            Container(
              child: currentQuestionData[5] != ''
                  // ? Image.asset(
                  //     'assets/images/question-' +
                  //         questionNumber.toString() +
                  //         '.webp',
                  //     width: screenSize.width > 1200
                  //         ? screenSize.width * 0.3
                  //         : screenSize.width * 0.9,
                  //     height: screenSize.width > 1200
                  //         ? screenSize.width * 0.2
                  //         : screenSize.width * 0.6,
                  //   )

                  ? QuestionImage(
                      questionNumber: questionNumber,
                      width: screenSize.width > 1200
                          ? screenSize.width * 0.3
                          : screenSize.width * 0.9,
                      height: screenSize.width > 1200
                          ? screenSize.width * 0.2
                          : screenSize.width * 0.6,
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
