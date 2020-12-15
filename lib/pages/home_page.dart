import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import '../pages/question_page.dart';
import '../common_widgets/raised_buttons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> questionData = [];
  List<List<dynamic>> resultData = [];

  loadQuestion() async {
    final csvData =
        await rootBundle.loadString("assets/pokemon_test_question.csv");
    List<List<dynamic>> csvQuestion = CsvToListConverter().convert(csvData);
    questionData = csvQuestion;
    setState(() {});
  }

  loadResult() async {
    final csvData =
        await rootBundle.loadString("assets/pokemon_test_results.csv");
    List<List<dynamic>> csvResults = CsvToListConverter().convert(csvData);
    resultData = csvResults;
    setState(() {});
  }

  void _startTest(BuildContext context) {
    loadQuestion();
    loadResult();
    if (questionData != null && resultData != null) {
      Navigator.of(context).push(MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => QuestionPage(
          questionData: questionData,
          resultData: resultData,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Flexible(
                flex: 4,
                child: Center(
                  child: Flex(
                    mainAxisAlignment: MainAxisAlignment.center,
                    direction: screenSize.width > 750
                        ? Axis.horizontal
                        : Axis.vertical,
                    children: [
                      Text('포켓몬스터',
                          style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              fontSize: 40,
                              fontWeight: FontWeight.w900)),
                      SizedBox(
                        width: 10,
                      ),
                      Text('실전배틀 유형 테스트',
                          style: TextStyle(
                              fontFamily: 'NotoSansKR',
                              fontSize: 40,
                              fontWeight: FontWeight.w900)),
                    ],
                  ),
                )),
            Flexible(
              flex: 8,
              child: Placeholder(),
            ),
            Flexible(
              flex: 2,
              child: Center(
                  child: Text(
                '나는 어떤 유형의 트레이너일까?\n당신의 실전배틀 성향을 알아보세요.',
                style: TextStyle(fontSize: 24),
              )),
            ),
            Flexible(
              flex: 3,
              child: Center(
                child: CustomRaisedButton(
                  buttonFontSize: 30,
                  buttonHeight: 70,
                  buttonWidth: 240,
                  buttonTextPadding: 10,
                  buttonText: '테스트 시작',
                  buttonColor: Colors.red,
                  textColor: Colors.white,
                  onPressed: () => _startTest(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
