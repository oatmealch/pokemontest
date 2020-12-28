import 'dart:math';
import 'package:flutter/material.dart';
import '../common_widgets/image_slider.dart';
import '../model/image_urls.dart';

class LoadingResultPage extends StatelessWidget {
  LoadingResultPage({Key key}) : super(key: key);
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
            child: Text('유형 분석 중...', style: TextStyle(fontSize: 30)),
          ),
          PokemonImageSlider(
            width: screenSize.width > 1200
                ? screenSize.width * 0.5
                : screenSize.width,
            height: screenSize.height * 0.3,
            imageMap: urlToResultImages,
            // imageMap: (List<String>.generate(
            //         8,
            //         (index) =>
            //             'assets/images/result-' + index.toString() + '.webp'))
            //     .asMap(),
            initialPage: initialPage(0, 7),
            playInterval: 1,
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
