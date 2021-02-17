import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_starter/helpers/helpers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../models/models.dart';

class DatabaseService extends GetxService {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<BaseModel>> collection(String path, {String orderby}) async {
    Query query = orderby == null ? _firestore.collection(path) : _firestore.collection(path).orderBy(orderby, descending: true);
    QuerySnapshot qs;
    try {
      qs = (await query.get(GetOptions(source: Source.cache))) ?? await query.get(GetOptions(source: Source.server));
    } catch (_) {
      qs = await query.get(GetOptions(source: Source.server));
    }
    GetLogger.to.i('${query} got ${qs.docs.length} from ${qs.metadata.isFromCache ? 'cache' : 'server'}');
    return qs.docs.map((QueryDocumentSnapshot doc) => BaseModel.fromDocumentSnapshot(doc)).toList();
  }

  Future<void> update({Map data, String path}) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      _firestore.doc(path).update(data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
