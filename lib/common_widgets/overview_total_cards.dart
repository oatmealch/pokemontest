import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OverviewTotalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[800]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TotalUserData(),
                        TotalClickedSNS(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TotalUserData extends StatelessWidget {
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
          return Center(
            child: Text('전체 누적 결과 수: ' + totalAmount.toString() + '명',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class TotalClickedSNS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var results =
        FirebaseFirestore.instance.collection('namecard').doc('sns_clicks');

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
          return Center(
            child: Column(
              children: [
                Text('명함 클릭 수 총합: ' + totalAmount.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                Row(
                  children: [
                    Text('블로거: ' + data['clicked_blogger'].toString() + ' / ',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Text('유튜브: ' + data['clicked_youtube'].toString() + ' / ',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Text('트위치: ' + data['clicked_twitch'].toString() + ' / ',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Text('트위터: ' + data['clicked_twitter'].toString(),
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                )
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
