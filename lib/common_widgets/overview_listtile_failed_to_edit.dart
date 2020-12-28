import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OverviewListtile extends StatelessWidget {
  OverviewListtile(this.questionData);
  final List<List<dynamic>> questionData;

  @override
  Widget build(BuildContext context) {
    var answersRef = FirebaseFirestore.instance.collection('answers');
    // var answers = FirebaseFirestore.instance.collection('answers').get().then(
    //     (QuerySnapshot querySnapshot) =>
    //         {querySnapshot.docs.forEach((doc) {})});

    return FutureBuilder<QuerySnapshot>(
      future: answersRef.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Placeholder();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return OverviewAnswersCard(
                questionNumber: document.id,
                currentData: questionData[int.parse(document.id)],
                firestoreData: document.data(),
              );
            }).toList(),
          );

          // return ListView(
          //   children: List.generate(
          //     12,
          //     (index) {
          //       Map<String, dynamic> data =
          //           answersRef.doc((index + 1).toString()).data.data();
          //       return OverviewAnswersCard(
          //         questionNumber: (index + 1).toString(),
          //         currentData: questionData[index + 1],
          //         firestoreData: data,
          //       );
          //     },
          //   ),
          // );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class OverviewAnswersCard extends StatelessWidget {
  const OverviewAnswersCard({
    Key key,
    @required this.questionNumber,
    @required this.currentData,
    @required this.firestoreData,
  }) : super(key: key);
  final String questionNumber;
  final List<dynamic> currentData;
  final Map<String, dynamic> firestoreData;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.grey[800]),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(questionNumber + ') ' + currentData[1],
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'NotoSansKR')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentData[6],
                        style: TextStyle(fontFamily: 'NotoSansKR'),
                      ),
                      Text(
                        currentData[10],
                        style: TextStyle(fontFamily: 'NotoSansKR'),
                      ),
                      Text(
                        currentData[14],
                        style: TextStyle(fontFamily: 'NotoSansKR'),
                      ),
                    ],
                  ),
                  AnswerChoices(
                    data: firestoreData,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerChoices extends StatelessWidget {
  AnswerChoices({Key key, @required this.data}) : super(key: key);
  final Map<String, dynamic> data;
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    data.forEach((key, value) {
      totalAmount += value;
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 80,
              height: 10,
              child: LinearProgressIndicator(
                value: data['1'] / totalAmount,
              ),
            ),
            Text(((data['1'] / totalAmount) * 100).toStringAsFixed(2) + '%'),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 80,
              height: 10,
              child: LinearProgressIndicator(
                value: data['2'] / totalAmount,
              ),
            ),
            Text(((data['2'] / totalAmount) * 100).toStringAsFixed(2) + '%')
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 80,
              height: 10,
              child: LinearProgressIndicator(
                value: data['3'] / totalAmount,
              ),
            ),
            Text(((data['3'] / totalAmount) * 100).toStringAsFixed(2) + '%')
          ],
        ),
      ],
    );
  }
}
