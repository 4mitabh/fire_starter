//User Model
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDoc {
  String uid;
  String path;
  Map<String, dynamic> properties;

  FirebaseDoc({this.uid, this.path, this.properties});
  factory FirebaseDoc.fromDocumentSnapshot(QueryDocumentSnapshot element) => FirebaseDoc.fromMap(element.data(), element.reference);
  factory FirebaseDoc.fromMap(Map data, DocumentReference ref) {
    return FirebaseDoc(
      uid: ref.id,
      path: ref.path,
      properties: data,
    );
  }

  Map<String, dynamic> toJson() => properties;
}
