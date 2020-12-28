import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import '../common_widgets/images_network.dart';
import '../pages/question_page.dart';
import '../common_widgets/raised_buttons.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
    @required this.analytics,
    @required this.observer,
  }) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  _HomePageState createState() => _HomePageState(
        analytics,
        observer,
      );
}

class _HomePageState extends State<HomePage> {
  _HomePageState(
    this.analytics,
    this.observer,
  );

  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;

  void _startTest(BuildContext context) async {
    // await _sendAnalyticsEvent();
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
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('실전배틀 유형 테스트  ',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
                ),
              ],
            ),
            // Image.asset(
            //   'assets/images/result-4.webp',
            //   width: screenSize.width > 1200
            //       ? screenSize.width * 0.7
            //       : screenSize.width,
            //   height: screenSize.height * 0.5,
            // ),
            ResultImage(
              codeResult: 4,
              width: screenSize.width > 1200
                  ? screenSize.width * 0.7
                  : screenSize.width,
              height: screenSize.height * 0.5,
            ),
            Center(
                child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.contain,
              child: Text(
                '나는 어떤 유형의 트레이너일까?\n당신의 실전배틀 성향을 알아보세요.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            )),
            Center(
              child: CustomRaisedButton(
                buttonFontSize: 30,
                buttonHeight: 70,
                buttonWidth: 260,
                buttonText: '테스트 시작',
                buttonColor: Colors.red,
                textColor: Colors.white,
                onPressed: () => _startTest(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: InkWell(
                  child: Text(
                    '해당 사이트에서 수집하는 개인정보 및 처리방침',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  onTap: () => _popupDialog(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              '해당 사이트에서 수집하는 개인정보 및 처리방침',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 400,
                  child: Text(
                    '<포켓몬스터 실전배틀 유형테스트>가 수집하는 다음의 정보는 익명으로 보관되며, 통계측정 목적으로만 이용됩니다.\n\n- 설문 응답항목\n- 접속 국가 및 지역',
                  )),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                    child: Text('확인'),
                    onPressed: () => Navigator.of(context).pop()),
              )
            ],
          );
        });
  }
}
