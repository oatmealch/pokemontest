import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'answer_button_layout.dart';
import '../common_widgets/question_content.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage(
      {Key key, @required this.questionData, @required this.resultData})
      : super(key: key);
  final List<List<dynamic>> questionData;
  final List<List<dynamic>> resultData;

  @override
  _QuestionPageState createState() =>
      _QuestionPageState(questionData, resultData);
}

class _QuestionPageState extends State<QuestionPage> {
  _QuestionPageState(@required this.questionData, @required this.resultData);

  int questionNumber = 1;
  int scoreMastered = 0;
  int scorePassion = 0;
  int scoreConfidence = 0;

  final List<List<dynamic>> questionData, resultData;

  void callbackInt(
    int valueQuestion,
    int valueMastered,
    int valuePassion,
    int valueConfidence,
  ) {
    setState(() {
      questionNumber = valueQuestion;
      scoreMastered = valueMastered;
      scorePassion = valuePassion;
      scoreConfidence = valueConfidence;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '포켓몬 실전배틀 유형검사',
            style: TextStyle(
                fontFamily: 'NotoSansKR', fontWeight: FontWeight.w700),
          ),
        ),
        body: Row(
          children: [
            Flexible(flex: 1, child: Container()),
            Flexible(
                flex: 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: SizedBox(
                          width: 1500,
                          height: 50,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 60),
                                SizedBox(
                                  width: 210,
                                  child: Center(
                                    child: LinearPercentIndicator(
                                      width: 200,
                                      lineHeight: 15,
                                      percent: questionNumber / 12,
                                      backgroundColor: Colors.red[100],
                                      progressColor: Colors.red,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                  child: Center(
                                    child: Text(
                                      questionNumber.toString() + '/12',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ),
                              ])),
                    ),
                    Flexible(
                      flex: 20,
                      child: QuestionContent(
                          questionData: questionData,
                          questionNumber: questionNumber),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(questionNumber.toString() +
                          '  ' +
                          scoreMastered.toString() +
                          '  ' +
                          scorePassion.toString() +
                          '  ' +
                          scoreConfidence.toString()),
                    ),
                    Flexible(
                      flex: 12,
                      child: AnswerSheetPage(
                          questionData: questionData,
                          resultData: resultData,
                          questionNumber: questionNumber,
                          scoreMastered: scoreMastered,
                          scorePassion: scorePassion,
                          scoreConfidence: scoreConfidence,
                          callbackInt: callbackInt),
                    ),
                    Flexible(flex: 1, child: Container()),
                  ],
                )),
            Flexible(flex: 1, child: Container()),
          ],
        ));
  }
}
