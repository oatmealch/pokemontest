import 'package:flutter/material.dart';

class LoadingResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('유형 분석 중...',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/images/resultFull01.jpg',
                fit: BoxFit.contain,
                width: screenSize.width * 0.7,
                height: screenSize.height * 0.4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
