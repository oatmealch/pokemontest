import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetPercentage extends StatelessWidget {
  GetPercentage(this.codeResult);
  final String codeResult;

  @override
  Widget build(BuildContext context) {
    var results = FirebaseFirestore.instance.collection('results').doc('types');

    return FutureBuilder<DocumentSnapshot>(
      future: results.get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("+ + +");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          int totalAmount = 0;
          data.forEach((key, value) {
            totalAmount += value;
          });
          String yourPercentage =
              ((data[codeResult] / totalAmount) * 100).toStringAsFixed(2);
          return Text(
            "전체 응답자의 $yourPercentage%가 당신과 같은 유형입니다.",
            style: TextStyle(fontFamily: 'Jua', fontSize: 20),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   var dataValue =
  //   FirebaseFirestore.instance.collection('dataValue');
  //
  //   return FutureBuilder<QuerySnapshot>(
  //     future: dataValue.get(),
  //     builder:
  //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (snapshot.hasError) {
  //         return Text("+ + +");
  //       }
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         Map<String, Map<String, dynamic>> loadedData = snapshot.getDocuments();
  //         Map<String, dynamic> currentResultData = loadedData[codeResult];
  //         Map<String, dynamic> totalAmount = loadedData['totalAmount'];
  //
  //         String yourPercentage =
  //         ((currentResultData['counts'] / totalAmount['counts']) * 100).toStringAsFixed(2);
  //         return Text(
  //           "전체 응답자의 $yourPercentage%가 당신과 같은 유형입니다.",
  //           style: TextStyle(fontSize: 20),
  //         );
  //       }
  //       return Text("로딩 중...");
  //     },
  //   );
  // }
}
