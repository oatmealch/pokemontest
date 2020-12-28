import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import '../common_widgets/overview_total_cards.dart';
import '../common_widgets/overview_listtile.dart';
// import '../common_widgets/overview_listtile copy.dart';
import '../common_widgets/overview_cards.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  List<List<dynamic>> questionData;
  List<List<dynamic>> resultData;
  int totalUser;
  Map<String, dynamic> typeData, answerData;

  void loadQuestion() async {
    final csvData =
        await rootBundle.loadString("assets/pokemon_test_question.csv");
    List<List<dynamic>> csvQuestion = CsvToListConverter().convert(csvData);
    questionData = csvQuestion;
    setState(() {});
  }

  void loadResult() async {
    final csvData =
        await rootBundle.loadString("assets/pokemon_test_results.csv");
    List<List<dynamic>> csvResults = CsvToListConverter().convert(csvData);
    resultData = csvResults;
    setState(() {});
  }

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    loadQuestion();
    loadResult();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Overview',
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection:
            screenSize.width > 1200 ? Axis.horizontal : Axis.vertical,
        child: Flex(
          direction: screenSize.width > 1200 ? Axis.horizontal : Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: screenSize.width > 1200
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                      width: screenSize.width > 1200
                          ? screenSize.width * 0.4
                          : screenSize.width * 0.9,
                      child: OverviewTotalCard()),
                ),
                Center(
                  child: Container(
                    width: screenSize.width > 1200
                        ? screenSize.width * 0.4
                        : screenSize.width * 0.9,
                    height: screenSize.width > 1200
                        ? screenSize.height * 0.95 - 150
                        : 1300,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      children: List.generate(8, (index) {
                        return FittedBox(
                            fit: BoxFit.contain,
                            child: OverviewCard(
                              typeNumber: index.toInt(),
                              resultData: resultData,
                            ));
                      }),
                    ),
                  ),
                ),
              ],
            ),
            Center(
                child: Container(
              width: screenSize.width > 1200
                  ? screenSize.width * 0.55
                  : screenSize.width * 0.9,
              height: screenSize.width > 1200 ? screenSize.height * 0.9 : 1800,
              // child: OverviewListtile(questionData),

              child: ListView(
                children: List.generate(
                    12,
                    (index) => OverviewListtile(
                          questionNumber: index + 1,
                          currentData: questionData[index + 1],
                        )),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
