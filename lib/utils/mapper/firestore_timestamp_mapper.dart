import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreTimestampMapper {
  static dynamic toJson(dynamic value) => value;
  static Timestamp fromJson(dynamic value) => value;
}
