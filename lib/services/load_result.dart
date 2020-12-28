// import 'package:cloud_firestore/cloud_firestore.dart';

// class LoadResult {
//   LoadResult(this.codeResult);
//   var results = FirebaseFirestore.instance.collection('results').doc('types');
//   final String codeResult;

//   Future<void> loadResult() {
//     return results
//         .update({codeResult: FieldValue.increment(1)})
//         .then((value) => print("Results Updated"))
//         .catchError((error) => print("Failed to update results: $error"));

//          Map<String, dynamic> data = results.data.data();
//           int totalAmount = 0;
//           data.forEach((key, value) {
//             totalAmount += value;
//           });
//   }
// }
