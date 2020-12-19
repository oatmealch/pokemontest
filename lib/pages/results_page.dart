import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import '../common_widgets/cards.dart';
import '../common_widgets/raised_buttons.dart';
import '../common_widgets/name_card.dart';

class ResultPage extends StatefulWidget {
  // const ResultPage({
  //   Key key,
  //   @required this.codeResult,
  // }) : super(key: key);

  // final codeResult;

  final String id;
  ResultPage(this.id);

  @override
  _ResultPageState createState() => _ResultPageState(this.id);
}

class _ResultPageState extends State<ResultPage> {
  _ResultPageState(this.id);

  final String id;

  final List<List<int>> decodeMap = [
    [1, 1, 1],
    [1, 1, 0],
    [1, 0, 1],
    [1, 0, 0],
    [0, 1, 1],
    [0, 1, 0],
    [0, 0, 1],
    [0, 0, 0]
  ];
  List<List<dynamic>> resultData = [];
  List<dynamic> currentResultData = [];

  loadResult() async {
    final csvData =
        await rootBundle.loadString("assets/pokemon_test_results.csv");
    List<List<dynamic>> csvResults = CsvToListConverter().convert(csvData);
    resultData = csvResults;
    currentResultData = resultData[int.parse(id)];
    setState(() {});
  }

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    loadResult();
  }

  @override
  Widget build(BuildContext context) {
    final codeResult = int.parse(widget.id);
    String resultTitle = currentResultData[1];
    var screenSize = MediaQuery.of(context).size;
    final List idResultAsMap = decodeMap[codeResult - 1];
    return Scaffold(
        appBar: AppBar(
          title: Text('테스트 결과',
              style: TextStyle(
                  fontFamily: 'NotoSansKR', fontWeight: FontWeight.w700)),
        ),
        body: Container(
          color: Colors.grey[200],
          child: Row(
            children: [
              Flexible(flex: 1, child: Container()),
              Flexible(
                flex: 25,
                child: Column(
                  children: [
                    Flexible(
                      flex: 8,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          CustomCard(
                            cardWidth: 1200,
                            cardHeight: screenSize.width > 1400 ? 800 : null,
                            isMain: true,
                            idResultAsMap: idResultAsMap,
                            cardTitle: '나의 실전배틀 유형',
                            titleColor: Colors.red,
                            cardSubTitle: resultTitle,
                            imagePath: 'assets/images/resultFull0' +
                                codeResult.toString() +
                                '.jpg',
                            imageHeight: 350,
                            cardText01: currentResultData[2],
                            cardText02: currentResultData[3],
                            cardText03: currentResultData[4],
                          ),
                          Flex(
                            mainAxisAlignment: MainAxisAlignment.center,
                            direction: screenSize.width > 1400
                                ? Axis.horizontal
                                : Axis.vertical,
                            children: [
                              CustomCard(
                                  cardWidth:
                                      screenSize.width > 1400 ? 600 : 1200,
                                  cardHeight:
                                      screenSize.width > 1400 ? 450 : null,
                                  isMain: false,
                                  cardTitle: '상대하기 편한 유형',
                                  titleColor: Colors.blue[600],
                                  cardSubTitle: currentResultData[6],
                                  imagePath: 'assets/images/resultFull0' +
                                      currentResultData[5].toString() +
                                      '.jpg',
                                  imageHeight: 230,
                                  cardText01: currentResultData[7],
                                  cardText02: '',
                                  cardText03: ''),
                              CustomCard(
                                  cardWidth:
                                      screenSize.width > 1400 ? 600 : 1200,
                                  cardHeight:
                                      screenSize.width > 1400 ? 450 : null,
                                  isMain: false,
                                  cardTitle: '상대하기 어려운 유형',
                                  titleColor: Colors.grey[800],
                                  cardSubTitle: currentResultData[9],
                                  imagePath: 'assets/images/resultFull0' +
                                      currentResultData[8].toString() +
                                      '.jpg',
                                  imageHeight: 230,
                                  cardText01: currentResultData[10],
                                  cardText02: '',
                                  cardText03: ''),
                            ],
                          ),
                          Flex(
                              mainAxisAlignment: MainAxisAlignment.center,
                              direction: screenSize.width > 1400
                                  ? Axis.horizontal
                                  : Axis.vertical,
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: SizedBox(
                                        width: screenSize.width > 1400
                                            ? 500
                                            : 1200,
                                        height: screenSize.width > 1400
                                            ? 300
                                            : null,
                                        child: Card(
                                          elevation: 6,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              Image.asset(
                                                screenSize.width > 1400
                                                    ? 'assets/images/bigKlara.jpg'
                                                    : 'assets/images/longKlara.jpg',
                                                fit: BoxFit.cover,
                                                alignment:
                                                    Alignment.centerRight,
                                              ),
                                              Center(
                                                child: Text(
                                                    "아래의 결과복사 버튼을 눌러서 이 테스트를 공유해주세요~",
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 18,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ))),
                                NameCard(),
                              ]),
                        ]),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: currentResultData[5] != 0
                            ? ShareButton(
                                codeResult: codeResult,
                                resultTitle: resultTitle)
                            : null)
                  ],
                ),
              ),
              Flexible(flex: 1, child: Container()),
            ],
          ),
        ));
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton(
      {Key key, @required this.codeResult, @required this.resultTitle})
      : super(key: key);
  final int codeResult;
  final String resultTitle;

  void _shareResult(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("내용이 복사되었습니다! 채팅창이나 SNS에 붙여넣어 공유해주세요~"),
    )));

    FlutterClipboard.copy('포켓몬 실전배틀 유형테스트 결과 저의 유형은 <' +
        resultTitle +
        '> 여러분은 뭐가 나올까요? https://pokemon-personality-test.ga/result/0' +
        codeResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomRaisedButton(
        buttonWidth: 150,
        buttonColor: Colors.red,
        buttonFontSize: 24,
        buttonHeight: 50,
        buttonText: '결과 복사',
        textColor: Colors.white,
        buttonTextPadding: 3,
        onPressed: () => _shareResult(context),
      ),
    );
  }
}
