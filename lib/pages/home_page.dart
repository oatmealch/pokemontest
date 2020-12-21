import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../common_widgets/cached_images.dart';
import '../pages/question_page.dart';
import '../common_widgets/raised_buttons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _startTest(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (context) => QuestionPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              direction:
                  screenSize.width > 750 ? Axis.horizontal : Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('포켓몬스터',
                      style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontSize: 40,
                          fontWeight: FontWeight.w900)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('실전배틀 유형 테스트  ',
                      style: TextStyle(
                          fontFamily: 'NotoSansKR',
                          fontSize: 40,
                          fontWeight: FontWeight.w900)),
                ),
              ],
            ),
            ResultImage(
              codeResult: 4,
              width: screenSize.width > 1200
                  ? screenSize.width * 0.7
                  : screenSize.width,
              height: screenSize.height * 0.5,
            ),
            Center(
                child: Text(
              '나는 어떤 유형의 트레이너일까?\n당신의 실전배틀 성향을 알아보세요.',
              style: TextStyle(fontSize: 24),
            )),
            Center(
              child: CustomRaisedButton(
                buttonFontSize: 30,
                buttonHeight: 70,
                buttonWidth: 250,
                buttonText: '테스트 시작',
                buttonColor: Colors.red,
                textColor: Colors.white,
                onPressed: () => _startTest(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
