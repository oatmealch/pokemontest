import 'package:cloud_firestore/cloud_firestore.dart';

class SendNamecardClicks {
  SendNamecardClicks(
    this.snsName,
  );
  var snsClicks =
      FirebaseFirestore.instance.collection('namecard').doc('sns_clicks');
  final String snsName;

  Future<void> sendNamecardClicks() {
    return snsClicks
        .update({snsName: FieldValue.increment(1)})
        .then((value) => print("Namecard Clicks Updated"))
        .catchError(
            (error) => print("Failed to update namecard clicks: $error"));
  }
}
