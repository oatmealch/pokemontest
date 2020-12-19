import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:csv/csv.dart';
import '../services/fluro_route.dart';
import './answer_button_layout.dart';
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

  int levelMastered, levelPassion, levelConfidence, codeResult, idResultAsInt;
  List idResultAsMap = [];
  int whereAnswerStarts = 6;
  Map<int, int> codeMap = {
    222: 1,
    221: 2,
    212: 3,
    211: 4,
    122: 5,
    121: 6,
    112: 7,
    111: 8,
  };

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    loadQuestion();
  }

  final ScrollController questionScrollController = ScrollController();

  void _convertScoreToLevel() {
    if (scoreMastered < 60) {
      levelMastered = 0;
    } else {
      levelMastered = 1;
    }
    if (scorePassion < 50) {
      levelPassion = 0;
    } else {
      levelPassion = 1;
    }
    if (scoreConfidence < 40) {
      levelConfidence = 0;
    } else {
      levelConfidence = 1;
    }
    idResultAsMap.add(levelMastered);
    idResultAsMap.add(levelPassion);
    idResultAsMap.add(levelConfidence);
    idResultAsInt = (levelMastered + 1) * 100 +
        (levelPassion + 1) * 10 +
        (levelConfidence + 1);

    codeResult = codeMap[idResultAsInt];
    setState(() {});
  }

  void answerPressed(int addMastered, int addPassion, int addConfidence) {
    questionScrollController.animateTo(-4096,
        curve: Curves.linear, duration: Duration(milliseconds: 50));

    if (questionNumber < 12) {
      questionNumber += 1;
    } else if (questionNumber == 12) {
      _convertScoreToLevel();

      Navigator.push(
          context,
          MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => LoadingResultPage()));
      Future.delayed(const Duration(milliseconds: 2000), () {
        Navigator.pop(context);
        Navigator.pop(context);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         fullscreenDialog: true,
        //         builder: (context) => ResultPage(
        //               codeResult: codeResult,
        //             )));

        // Navigator.of(context).pushNamed(FluroRoutes.RouteToResultPage,
        //     arguments: {"id": codeResult});

        FluroRoutes.fluroRouter.navigateTo(
            context,
            FluroRoutes.routeToResultPage
                .replaceAll(":id", codeResult.toString()));
      });
    }
    scoreMastered += addMastered;
    scorePassion += addPassion;
    scoreConfidence += addConfidence;
    print('문항번호: $questionNumber' +
        ' / 숙련도: $scoreMastered' +
        ' / 승부욕: $scorePassion' +
        ' / 자신감: $scoreConfidence');
    setState(() {});
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
            '포켓몬 실전배틀 유형검사',
            style: TextStyle(
                fontFamily: 'NotoSansKR', fontWeight: FontWeight.w700),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: screenSize.width * 0.8,
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
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              Flexible(
                flex: 8,
                child: SingleChildScrollView(
                  controller: questionScrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuestionContent(
                          currentQuestionData: questionData[questionNumber],
                          questionNumber: questionNumber),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: AnswerSheetPage(
                            currentQuestionData: questionData[questionNumber],
                            questionNumber: questionNumber,
                            scoreMastered: scoreMastered,
                            scorePassion: scorePassion,
                            scoreConfidence: scoreConfidence,
                            answerPressed: answerPressed),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
