import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  Future add(String collection, dynamic data) async {
    try {
      await _firestoreInstance.collection(collection).add(data);
      return null;
    } catch (e) {
      return e;
    }
  }

  Future fetch(String collection, String email) async {
    try {
      dynamic snapshot = await _firestoreInstance
          .collection(collection)
          .where("email", isEqualTo: email)
          .get();
      return snapshot;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future fetchListen(String collection, String email) async {
    try {
      dynamic snapshotStream = await _firestoreInstance
          .collection(collection)
          .where("email", isEqualTo: email)
          .orderBy("date", descending: true)
          .snapshots();
      return snapshotStream;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future update(
      String collection, String email, dynamic doc, dynamic data) async {
    try {
      await _firestoreInstance.collection(collection).doc(doc).update(data);
      return 1;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
