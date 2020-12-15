import 'package:flutter/material.dart';

class QuestionContent extends StatelessWidget {
  const QuestionContent({
    Key key,
    @required this.questionData,
    @required this.questionNumber,
  }) : super(key: key);

  final List<List<dynamic>> questionData;
  final int questionNumber;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> currentQuestionData =
        questionData.asMap()[questionNumber];
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
              width: double.infinity,
              child: Text(
                currentQuestionData[1],
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'NotoSansKR', fontSize: 18),
              )),
          SizedBox(height: 10),
          SizedBox(
              width: double.infinity,
              child: Text(
                currentQuestionData[2],
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'NotoSansKR', fontSize: 18),
              )),
          SizedBox(height: 10),
          SizedBox(
              width: double.infinity,
              child: Text(
                currentQuestionData[3],
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'NotoSansKR', fontSize: 18),
              )),
          SizedBox(height: 10),
          SizedBox(
              width: double.infinity,
              child: Text(
                currentQuestionData[4],
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'NotoSansKR', fontSize: 18),
              )),
          SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
