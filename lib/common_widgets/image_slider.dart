import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PokemonImageSlider extends StatelessWidget {
  PokemonImageSlider(
      {Key key,
      this.width,
      this.height,
      @required this.imageMap,
      @required this.playInterval,
      @required this.initialPage})
      : super(key: key);
  final double width, height;
  final int playInterval, initialPage;
  final Map imageMap;
  final List imageList = [];

  @override
  Widget build(BuildContext context) {
    imageMap.forEach((key, value) {
      imageList.add(value);
    });
    return Container(
      width: width,
      height: height,
      child: CarouselSlider(
        items: imageList
            .map((item) => Container(
                  child: Center(
                    child: Image.network(item,
                        fit: BoxFit.contain, width: width * 0.8),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: height,
          autoPlay: true,
          enableInfiniteScroll: true,
          initialPage: initialPage,
          autoPlayInterval: Duration(seconds: playInterval),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
