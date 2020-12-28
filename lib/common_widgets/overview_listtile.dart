import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OverviewListtile extends StatelessWidget {
  const OverviewListtile(
      {Key key, @required this.questionNumber, @required this.currentData})
      : super(key: key);
  final int questionNumber;
  final List<dynamic> currentData;

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
                  child: Text(questionNumber.toString() + ') ' + currentData[1],
                      style: TextStyle(color: Colors.white)),
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
                      Text(currentData[6]),
                      Text(currentData[10]),
                      Text(currentData[14]),
                    ],
                  ),
                  AnswerChoices(questionNumber.toString(), currentData),
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
  AnswerChoices(this.questionNumber, this.currentData);
  final String questionNumber;
  final List<dynamic> currentData;

  @override
  Widget build(BuildContext context) {
    var answers = FirebaseFirestore.instance.collection('answers');

    return FutureBuilder<DocumentSnapshot>(
      future: answers.doc(questionNumber).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Placeholder();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          int totalAmount = 0;
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
                  Text(((data['1'] / totalAmount) * 100).toStringAsFixed(2) +
                      '%'),
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
                  Text(((data['2'] / totalAmount) * 100).toStringAsFixed(2) +
                      '%')
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
                  Text(((data['3'] / totalAmount) * 100).toStringAsFixed(2) +
                      '%')
                ],
              ),
            ],
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
