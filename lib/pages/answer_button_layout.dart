import 'package:flutter/material.dart';
import '../common_widgets/raised_buttons.dart';

class AnswerSheetPage extends StatelessWidget {
  AnswerSheetPage({
    Key key,
    @required this.currentQuestionData,
    @required this.questionNumber,
    @required this.scoreMastered,
    @required this.scorePassion,
    @required this.scoreConfidence,
    @required this.answerPressed,
  }) : super(key: key);

  final List<dynamic> currentQuestionData;
  final int questionNumber, scoreMastered, scorePassion, scoreConfidence;
  final Function answerPressed;
  final int whereAnswerStarts = 6;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: AnswerButton(
                currentQuestionData: currentQuestionData,
                answerPressed: answerPressed,
                whereAnswerStarts: whereAnswerStarts,
                thisButtonNumber: 1),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: AnswerButton(
                currentQuestionData: currentQuestionData,
                answerPressed: answerPressed,
                whereAnswerStarts: whereAnswerStarts,
                thisButtonNumber: 2),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: AnswerButton(
                currentQuestionData: currentQuestionData,
                answerPressed: answerPressed,
                whereAnswerStarts: whereAnswerStarts,
                thisButtonNumber: 3),
          )
        ],
      ),
    );
  }
}
