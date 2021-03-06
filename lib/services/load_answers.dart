import 'package:cloud_firestore/cloud_firestore.dart';

class LoadAnswers {
  LoadAnswers(this.questionNumber, this.answerNumber);
  var answers = FirebaseFirestore.instance.collection('answers');
  final String questionNumber, answerNumber;

  Future<void> loadAnswers() {
    return answers
        .doc(questionNumber)
        .update({answerNumber: FieldValue.increment(1)})
        .then((value) => print("Answers Updated"))
        .catchError((error) => print("Failed to update answers: $error"));
  }
}
