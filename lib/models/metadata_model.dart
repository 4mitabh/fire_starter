import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_starter/constants/firebase_paths.dart';

class MetadataModel {
  int build;
  int majorVersion;
  int minorVersion;
  String version;

  MetadataModel({
    required this.build,
    required this.minorVersion,
    required this.majorVersion,
    required this.version,
  });

  Map toJson() => {'build': build, 'version': version};

  static Future<MetadataModel> get() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      DocumentSnapshot doc = await db.doc('${FirebasePaths.prefix}${FirebasePaths.metadata}/all').get();
      return MetadataModel._fromDocumentSnapshot(doc);
    } on Exception catch (e) {
      return MetadataModel(build: 1, version: '0.0.0', majorVersion: 0, minorVersion: 0);
    }
  }

  factory MetadataModel._fromDocumentSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data();
    if (data == null) return MetadataModel(build: 1, version: '0.0.0', majorVersion: 0, minorVersion: 0);
    return MetadataModel(
        build: data['build'],
        version: data['version'],
        majorVersion: int.parse(data['version'].split('.')[0]),
        minorVersion: int.parse(data['version'].split('.')[1]));
  }

  String toString() {
    return toJson().toString();
  }
}
