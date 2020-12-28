import 'package:flutter/material.dart';
import '../model/image_urls.dart';

class QuestionImage extends StatelessWidget {
  const QuestionImage(
      {Key key, @required this.questionNumber, this.width, this.height})
      : super(key: key);

  final int questionNumber;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      urlToQuestionImages[questionNumber],
      width: width,
      height: height,
      // loadingBuilder: (context, child, progress) {
      //   return progress == null
      //       ? child
      //       : Center(
      //           child: SizedBox(
      //               width: width * 0.5,
      //               height: 15,
      //               child: LinearProgressIndicator()),
      //         );
      // },
    );
  }
}

//

class ResultImage extends StatelessWidget {
  const ResultImage(
      {Key key, @required this.codeResult, this.width, this.height})
      : super(key: key);

  final int codeResult;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      urlToResultImages[codeResult],
      width: width,
      height: height,
      // loadingBuilder: (context, child, progress) {
      //   return progress == null
      //       ? child
      //       : Center(
      //           child: SizedBox(
      //               width: width * 0.5,
      //               height: 15,
      //               child: LinearProgressIndicator()),
      //         );
      // },
    );
  }
}
