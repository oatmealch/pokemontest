import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:csv/csv.dart';
import '../services/send_result.dart';
import '../services/send_answers.dart';
import '../services/routes.dart';
import '../common_widgets/answer_button_layout.dart';
import '../common_widgets/question_content.dart';
import './loading_result.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<List<dynamic>> questionData = [];

  int questionNumber = 1;
  int scoreMastered = 0;
  int scorePassion = 0;
  int scoreConfidence = 0;

  int levelMastered, levelPassion, levelConfidence, codeResult;
  List idResultAsMap = [];
  int whereAnswerStarts = 6;

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    loadQuestion();
  }

  final ScrollController questionScrollController = ScrollController();
  Map<String, String> imageMap;

  void _convertScoreToLevel() {
    if (scoreMastered < 70) {
      levelMastered = 0;
    } else {
      levelMastered = 1;
    }
    if (scorePassion < 50) {
      levelPassion = 0;
    } else {
      levelPassion = 1;
    }
    if (scoreConfidence < 50) {
      levelConfidence = 0;
    } else {
      levelConfidence = 1;
    }
    idResultAsMap.add(levelMastered);
    idResultAsMap.add(levelPassion);
    idResultAsMap.add(levelConfidence);
    codeResult = levelMastered * 4 + levelPassion * 2 + levelConfidence;

    setState(() {});
  }

  void answerPressed(
      int addMastered, int addPassion, int addConfidence, int answerNumber) {
    questionScrollController.animateTo(
      0,
      curve: Curves.linear,
      duration: Duration(milliseconds: 50),
    );
    scoreMastered += addMastered;
    scorePassion += addPassion;
    scoreConfidence += addConfidence;
    questionNumber += 1;

    //답변 전송
    // SendAnswers(
    //   (questionNumber - 1).toString(),
    //   answerNumber.toString(),
    // ).sendAnswers();
    setState(() {});
    if (questionNumber > 12) {
      _convertScoreToLevel();

      //결과 전송
      // SendResult(codeResult.toString()).sendResult();
      Future.delayed(const Duration(milliseconds: 3000), () {
        Navigator.pop(context);
        FluroRoutes.fluroRouter.navigateTo(
          context,
          FluroRoutes.routeToResultPage
              .replaceAll(":id", codeResult.toString())
              .replaceAll(":sharedCheck", ''),
        );
      });
    }
    // print('문항번호: ' +
    //     (questionNumber - 1).toString() +
    //     ' / 숙련도: $scoreMastered' +
    //     ' / 승부욕: $scorePassion' +
    //     ' / 자신감: $scoreConfidence');
  }

  loadQuestion() async {
    final csvData =
        await rootBundle.loadString("assets/pokemon_test_question.csv");
    List<List<dynamic>> csvQuestion = CsvToListConverter().convert(csvData);
    questionData = csvQuestion;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '포켓몬 실전배틀 유형테스트',
            style: TextStyle(
                fontFamily: 'NotoSansKR', fontWeight: FontWeight.w700),
          ),
        ),
        body: questionNumber > 12
            ? LoadingResultPage()
            : Center(
                child: Container(
                  width: screenSize.width > 1200
                      ? screenSize.width * 0.5
                      : screenSize.width * 0.9,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 10),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: LinearPercentIndicator(
                                    width: screenSize.width * 0.4,
                                    lineHeight: 15,
                                    percent: questionNumber / 12,
                                    backgroundColor: Colors.red[100],
                                    progressColor: Colors.red,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    questionNumber.toString() + '/12',
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 22,
                                        fontFamily: 'Jua',
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Flexible(
                        flex: 9,
                        child: SingleChildScrollView(
                          controller: questionScrollController,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                clipBehavior: Clip.antiAlias,
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: QuestionContent(
                                      questionScrollController:
                                          questionScrollController,
                                      currentQuestionData:
                                          questionData[questionNumber],
                                      questionNumber: questionNumber),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: AnswerSheetPage(
                                    currentQuestionData:
                                        questionData[questionNumber],
                                    questionNumber: questionNumber,
                                    scoreMastered: scoreMastered,
                                    scorePassion: scorePassion,
                                    scoreConfidence: scoreConfidence,
                                    answerPressed: answerPressed),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }
}
