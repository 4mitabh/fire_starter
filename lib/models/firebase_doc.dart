//User Model
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDoc {
  String id;
  String path;
  Map<String, dynamic> properties;

  FirebaseDoc({required this.id, required this.path, required this.properties});
  factory FirebaseDoc.fromDocumentSnapshot(DocumentSnapshot snapshot) => FirebaseDoc.fromMap(snapshot.data() ?? {}, snapshot.reference);
  factory FirebaseDoc.fromMap(Map<String, dynamic> data, DocumentReference ref) {
    return FirebaseDoc(
      id: ref.id,
      path: ref.path,
      properties: data,
    );
  }

  Map<String, dynamic> toJson() => properties;
}
