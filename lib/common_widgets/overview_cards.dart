import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../common_widgets/images_network.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard(
      {Key key, @required this.typeNumber, @required this.resultData})
      : super(key: key);
  final int typeNumber;
  final List<List<dynamic>> resultData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.grey[800]),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    resultData[typeNumber + 1][1],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: SizedBox(
                      width: 120,
                      height: 100,
                      child: FittedBox(
                        clipBehavior: Clip.antiAlias,
                        fit: BoxFit.contain,
                        // child: Image.asset('assets/images/result-' +
                        //     typeNumber.toString() +
                        //     '.webp'),
                        child: ResultImage(
                          codeResult: typeNumber,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TypePercentage(typeNumber.toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TypePercentage extends StatelessWidget {
  TypePercentage(this.typeNumber);
  final String typeNumber;

  @override
  Widget build(BuildContext context) {
    var results = FirebaseFirestore.instance.collection('results').doc('types');

    return FutureBuilder<DocumentSnapshot>(
      future: results.get(),
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
          String typePercentageString =
              ((data[typeNumber] / totalAmount) * 100).toStringAsFixed(2) + '%';
          return Center(
            child: Column(
              children: [
                CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 15,
                  percent: data[typeNumber] / totalAmount,
                  center: Text(typePercentageString,
                      style: TextStyle(fontSize: 15)),
                ),
                Text(data[typeNumber].toString() + '명')
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
