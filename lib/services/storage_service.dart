import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_starter/helpers/helpers.dart';
import 'package:fire_starter/services/package_info.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class StorageService extends GetxService {
  static FirebaseStorage _storage = FirebaseStorage.instance;

  static Future<ListResult> list(String path) async {
    ListResult result = await _storage.ref(path).listAll();

    result.items.forEach((Reference ref) {
      print('Found file: $ref');
    });

    result.prefixes.forEach((Reference ref) {
      print('Found directory: $ref');
    });
    return result;
  }

  static Future<File> getImageFileFromAssets(ByteData byteData) async {
    final file = File('${(await getTemporaryDirectory()).path}/${Random().nextInt(1000).toString()}');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  static Future<void> upload({required File file, required String path, Map<String, String> customMetadata = const {}}) async {
    SettableMetadata metadata = SettableMetadata(
      cacheControl: 'max-age=60',
      customMetadata: customMetadata,
    );

    UploadTask task = _storage.ref(path).putFile(file, metadata);

    task.snapshotEvents.listen((TaskSnapshot snapshot) {
      GetLogger.to.d('Task state: ${snapshot.state}');
      GetLogger.to.d('Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
    }, onError: (e) {
      // The final snapshot is also available on the task via `.snapshot`,
      // this can include 2 additional states, `TaskState.error` & `TaskState.canceled`
      GetLogger.to.w(e);
      Get.snackbar('Upload $path', e.toString());
    });

    // We can still optionally use the Future alongside the stream.
    try {
      await task;
      GetLogger.to.i('Upload $path Complete');
      Get.snackbar('Upload $path', 'Complete');
    } on FirebaseException catch (e) {
      GetLogger.to.w(e);
      Get.snackbar('Upload $path', e.toString());
    }
  }

  static packAndUpload({required String path}) async {
    List<Asset> resultList = <Asset>[];
    List<String> imagePaths = <String>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        // selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: PackageInfoService.appName,
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      GetLogger.to.w(e);
    }
    for (var r in resultList) {
      //   // upload(filePath: r. , path: path+(r.name?? Random().nextInt(1000).toString() ) );
      // }
      // for (var r in imagePaths) {
      var file = await getImageFileFromAssets(await r.getByteData());
      upload(file: file, path: path + '/' + Random().nextInt(1000).toString() + '.jpg');
    }
  }
}
