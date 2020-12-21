import 'dart:math';
import 'package:flutter/material.dart';
import '../common_widgets/image_slider.dart';
import '../model/image_urls.dart';

class LoadingResultPage extends StatelessWidget {
  final Random rnd = new Random();
  int initialPage(int min, int max) => min + rnd.nextInt(max - min);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('유형 분석 중...',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          ),
          PokemonImageSlider(
            width: screenSize.width > 1200
                ? screenSize.width * 0.5
                : screenSize.width,
            height: screenSize.height * 0.3,
            imageMap: urlToResultImages,
            initialPage: initialPage(0, 7),
            playInterval: 1,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: ResultImage(
          //     codeResult: 7,
          //     width: screenSize.width * 0.7,
          //     height: screenSize.height * 0.4,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
