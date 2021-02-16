//User Model
import 'package:cloud_firestore/cloud_firestore.dart';

class BaseModel {
  String uid;
  String path;
  Map<String, dynamic> properties;

  BaseModel({this.uid, this.path, this.properties});
  factory BaseModel.fromDocumentSnapshot(QueryDocumentSnapshot element) => BaseModel.fromMap(element.data(), element.reference);
  factory BaseModel.fromMap(Map data, DocumentReference ref) {
    return BaseModel(
      uid: ref.id,
      path: ref.path,
      properties: data,
    );
  }

  Map<String, dynamic> toJson() => properties;

  Future<void> update() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      _firestore.doc(path).update(properties);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
