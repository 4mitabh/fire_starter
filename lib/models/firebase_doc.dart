//User Model
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDoc {
  String uid;
  String path;
  Map<String, dynamic> properties;

  FirebaseDoc({this.uid, this.path, this.properties});
  factory FirebaseDoc.fromDocumentSnapshot(DocumentSnapshot snapshot) => FirebaseDoc.fromMap(snapshot.data(), snapshot.reference);
  factory FirebaseDoc.fromMap(Map data, DocumentReference ref) {
    return FirebaseDoc(
      uid: ref.id,
      path: ref.path,
      properties: data,
    );
  }

  Map<String, dynamic> toJson() => properties;
}
