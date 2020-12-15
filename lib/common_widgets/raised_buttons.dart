import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    @required this.buttonText,
    @required this.buttonWidth,
    @required this.buttonFontSize,
    @required this.buttonHeight,
    @required this.buttonTextPadding,
    @required this.buttonColor,
    @required this.textColor,
    @required this.onPressed,
  });

  final String buttonText;
  final double buttonWidth, buttonHeight, buttonFontSize, buttonTextPadding;
  final Color buttonColor, textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: RaisedButton(
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: buttonFontSize,
          ),
        ),
        color: buttonColor,
        onPressed: onPressed,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    @required this.currentQuestionData,
    @required this.answerPressed,
    @required this.whereAnswerStarts,
    @required this.thisButtonNumber,
  });

  final List<dynamic> currentQuestionData;
  final Function answerPressed;
  final int whereAnswerStarts, thisButtonNumber;

  @override
  Widget build(BuildContext context) {
    int answerIndex = whereAnswerStarts + ((thisButtonNumber - 1) * 4);
    return CustomRaisedButton(
      buttonText: currentQuestionData.asMap()[answerIndex].toString(),
      buttonWidth: 700,
      buttonFontSize: 18,
      buttonHeight: 80,
      buttonTextPadding: 6,
      buttonColor: Colors.white70,
      textColor: Colors.black54,
      onPressed: () => answerPressed(
        currentQuestionData.asMap()[answerIndex + 1],
        currentQuestionData.asMap()[answerIndex + 2],
        currentQuestionData.asMap()[answerIndex + 3],
      ),
    );
  }
}