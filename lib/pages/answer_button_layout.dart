import 'package:flutter/material.dart';
import 'package:pokemon_test/pages/results_page.dart';
import '../common_widgets/raised_buttons.dart';

class AnswerSheetPage extends StatefulWidget {
  const AnswerSheetPage({
    Key key,
    @required this.questionData,
    @required this.resultData,
    @required this.questionNumber,
    @required this.scoreMastered,
    @required this.scorePassion,
    @required this.scoreConfidence,
    @required this.callbackInt,
  }) : super(key: key);

  final List<List<dynamic>> questionData, resultData;
  final int questionNumber, scoreMastered, scorePassion, scoreConfidence;
  final Function callbackInt;

  @override
  _AnswerSheetPageState createState() => _AnswerSheetPageState(
        questionData: questionData,
        resultData: resultData,
        questionNumber: questionNumber,
        scoreMastered: scoreMastered,
        scorePassion: scorePassion,
        scoreConfidence: scoreConfidence,
        callbackInt: callbackInt,
      );
}

class _AnswerSheetPageState extends State<AnswerSheetPage> {
  _AnswerSheetPageState({
    @required this.questionData,
    @required this.resultData,
    @required this.questionNumber,
    @required this.scoreMastered,
    @required this.scorePassion,
    @required this.scoreConfidence,
    @required this.callbackInt,
  });

  final List<List<dynamic>> questionData, resultData;
  int questionNumber, scoreMastered, scorePassion, scoreConfidence;
  int levelMastered, levelPassion, levelConfidence, codeResult, idResultAsInt;
  List idResultAsMap = [];
  Function callbackInt;
  int whereAnswerStarts = 5;
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

  void _convertScoreToLevel() {
    if (scoreMastered < 40) {
      levelMastered = 0;
    } else {
      levelMastered = 1;
    }
    if (scorePassion < 40) {
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

  void _answerPressed(int addMastered, int addPassion, int addConfidence) {
    setState(() {
      if (questionNumber < 12) {
        questionNumber += 1;
      } else if (questionNumber == 12) {
        _convertScoreToLevel();

        final List<dynamic> currentResultData = resultData.asMap()[codeResult];
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => ResultPage(
                      codeResult: codeResult,
                      idResultAsMap: idResultAsMap,
                      currentResultData: currentResultData,
                    )));
      }
      scoreMastered += addMastered;
      scorePassion += addPassion;
      scoreConfidence += addConfidence;
      callbackInt(questionNumber, scoreMastered, scorePassion, scoreConfidence);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> currentQuestionData =
        questionData.asMap()[questionNumber];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: AnswerButton(
                currentQuestionData: currentQuestionData,
                answerPressed: _answerPressed,
                whereAnswerStarts: whereAnswerStarts,
                thisButtonNumber: 1),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: AnswerButton(
                currentQuestionData: currentQuestionData,
                answerPressed: _answerPressed,
                whereAnswerStarts: whereAnswerStarts,
                thisButtonNumber: 2),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: AnswerButton(
                currentQuestionData: currentQuestionData,
                answerPressed: _answerPressed,
                whereAnswerStarts: whereAnswerStarts,
                thisButtonNumber: 3),
          ),
        ],
      ),
    );
  }
}
