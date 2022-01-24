import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final CollectionReference _mainCollection = _firestore.collection('Vendor_Services');
class Database {
  static String userUid;
  static Future<void> addItem({
    String Service_Name,
    String Service_Description,
    String Service_HourlyRate,
    String Service_Category,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "S_Name": Service_Name,
      "S_Description": Service_Description,
      "S_HourlyRate": Service_HourlyRate,
      "S_Category": Service_Category,
      "S_uid":user.uid,

    };
    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    String Service_Name,
    String Service_Description,
    String Service_HourlyRate,
    String Service_Category,
  }) async {
    _firestore.collection("Vendor_Services").where('S_uid',isEqualTo: user.uid).
    snapshots().listen(
    (data) => print('grower ${data.docs[0]['name']}'));
    DocumentReference documentReferencer = _mainCollection.doc();
    Map<String, dynamic> data = <String, dynamic>{
      "S_Name": Service_Name,
      "S_Description": Service_Description,
      "S_HourlyRate": Service_HourlyRate,
      "S_Category": Service_Category,
      "S_uid":user.uid,
    };
    await documentReferencer
        .update(data)
        .whenComplete(() => print("Notes updated to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem({
    String docId,
  }) async {

    DocumentReference documentReferencer = _mainCollection.doc(user.uid);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}