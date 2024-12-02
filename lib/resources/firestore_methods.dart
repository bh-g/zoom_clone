import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream to get meeting history
  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('meetings')
      .snapshots();

  // Method to add meeting to history with only the meeting name
  void addToMeetingHistory(String meetingName) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .add({
        'meetingName': meetingName,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      print('Error adding meeting to Firestore: $e');
    }
  }
}
