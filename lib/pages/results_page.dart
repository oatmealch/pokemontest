import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import '../common_widgets/cards.dart';
import '../common_widgets/raised_buttons.dart';
import '../common_widgets/name_card.dart';

class ResultPage extends StatefulWidget {
  final String id, sharedCheck;
  ResultPage(this.id, this.sharedCheck);

  @override
  _ResultPageState createState() => _ResultPageState(this.id, this.sharedCheck);
}

class _ResultPageState extends State<ResultPage> {
  _ResultPageState(this.id, this.sharedCheck);

  final String id, sharedCheck;
  List<List<dynamic>> resultData = [];
  List<dynamic> currentResultData = [];
  final ScrollController _scrollController = ScrollController();

  loadResult() async {
    final csvData =
        await rootBundle.loadString("assets/pokemon_test_results.csv");
    List<List<dynamic>> csvResults = CsvToListConverter().convert(csvData);
    resultData = csvResults;
    currentResultData = resultData[int.parse(id) + 1];
    setState(() {});
  }

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    if (int.parse(id) < 8) {
      if (sharedCheck == "shared" || sharedCheck == '') {
        loadResult();
      }
    } else {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final codeResult = int.parse(widget.id);
    String resultTitle = currentResultData[1];
    var screenSize = MediaQuery.of(context).size;

    final List idResultAsMap = [
      codeResult ~/ 4,
      codeResult >= 4 ? (codeResult - 4) ~/ 2 : (codeResult) ~/ 2,
      codeResult % 2,
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('테스트 결과',
              style: TextStyle(
                  fontFamily: 'NotoSansKR', fontWeight: FontWeight.w700)),
        ),
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Flexible(
              flex: 8,
              child: Scrollbar(
                controller: _scrollController,
                radius: Radius.circular(6),
                isAlwaysShown: true,
                thickness: 20,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(children: [
                    CustomCard(
                      cardWidth: 1200,
                      cardHeight: null,
                      isMain: true,
                      idResultAsMap: idResultAsMap,
                      cardTitle: '나의 실전배틀 유형',
                      titleColor: Colors.red,
                      cardSubTitle: resultTitle,
                      codeResult: codeResult,
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
                            cardWidth: screenSize.width > 1400 ? 600 : 1200,
                            cardHeight: screenSize.width > 1400 ? 450 : null,
                            isMain: false,
                            cardTitle: '상대하기 편한 유형',
                            titleColor: Colors.blue[600],
                            cardSubTitle: currentResultData[6],
                            codeResult: currentResultData[5],
                            imageHeight: 230,
                            cardText01: currentResultData[7],
                            cardText02: '',
                            cardText03: ''),
                        CustomCard(
                            cardWidth: screenSize.width > 1400 ? 600 : 1200,
                            cardHeight: screenSize.width > 1400 ? 450 : null,
                            isMain: false,
                            cardTitle: '상대하기 어려운 유형',
                            titleColor: Colors.grey[800],
                            cardSubTitle: currentResultData[9],
                            codeResult: currentResultData[8],
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
                                  width: screenSize.width > 1400 ? 500 : 1200,
                                  height: screenSize.width > 1400 ? 300 : null,
                                  child: Card(
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        Image.asset(
                                          screenSize.width > 1400
                                              ? 'assets/images/bigKlara.jpg'
                                              : 'assets/images/longKlara.jpg',
                                          fit: BoxFit.cover,
                                          alignment: Alignment.centerRight,
                                        ),
                                        Center(
                                          child: FittedBox(
                                            alignment: Alignment.center,
                                            fit: BoxFit.contain,
                                            child: Text(
                                                sharedCheck == "shared"
                                                    ? '아래의 버튼을 눌러 여러분도 테스트를 해보세요~'
                                                    : '아래의 결과복사 버튼을 눌러서 이 테스트를 공유해주세요~',
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 18,
                                                    fontFamily: 'Jua')),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))),
                          NameCard(),
                        ]),
                  ]),
                ),
              ),
            ),
            Flexible(
                flex: 1,
                child: ShareButton(
                  codeResult: codeResult,
                  resultTitle: resultTitle,
                  isShared: sharedCheck == "shared",
                ))
          ],
        ));
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key key,
    @required this.codeResult,
    @required this.resultTitle,
    @required this.isShared,
  }) : super(key: key);
  final int codeResult;
  final String resultTitle;
  final bool isShared;

  void _shareResult(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("내용이 복사되었습니다! 채팅창이나 SNS에 붙여넣어 공유해주세요~"),
    )));

    FlutterClipboard.copy('저의 유형은 <' +
        resultTitle +
        '> 여러분은 뭐가 나올까요? https://pokemon-personality-share.web.app/' +
        codeResult.toString());
  }

  void _tryAgain(context) {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomRaisedButton(
        buttonWidth: 200,
        buttonColor: Colors.red,
        buttonFontSize: 24,
        buttonHeight: 50,
        buttonText: isShared ? '나도 해보기' : '결과 복사',
        textColor: Colors.white,
        onPressed: () => isShared ? _tryAgain(context) : _shareResult(context),
      ),
    );
  }
}
