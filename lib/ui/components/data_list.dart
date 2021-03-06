import 'package:fire_starter/models/models.dart';
import 'package:fire_starter/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataListController extends GetxController {
  // final navMenuIndex = 0.obs;
}

class DataList extends GetView {
  static Widget builder({Function()? onPressed, required String path, required Widget Function(Map) itemBuilder}) => GetBuilder<DataListController>(
      init: DataListController(),
      builder: (controller) => DataList(
            controller,
            path: path,
            itemBuilder: itemBuilder,
            onPressed: onPressed,
          ));

  DataList(DataListController controller, {required this.path, this.onPressed, required this.itemBuilder});
  final String path;
  final void Function()? onPressed;
  final Widget Function(Map data) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FirebaseDoc>>(
        future: DatabaseService.collection(path),
        builder: (context, ss) {
          if (!ss.hasData) return Text('...');
          return ListView.builder(
            itemCount: ss.data!.length,
            itemBuilder: (_, index) {
              return itemBuilder(ss.data![index].properties);
              // return Text(ss.data[index].properties['name'] ?? ss.data[index].properties['phone'] ?? ss.data[index].properties['email']);
            },
          );
        });
  }
}
