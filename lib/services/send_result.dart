import 'package:cloud_firestore/cloud_firestore.dart';

class SendResult {
  SendResult(this.codeResult);
  var results = FirebaseFirestore.instance.collection('results').doc('types');
  final String codeResult;

  Future<void> sendResult() {
    return results
        .update({codeResult: FieldValue.increment(1)})
        .then((value) => print("Results Updated"))
        .catchError((error) => print("Failed to update results: $error"));
  }
}


