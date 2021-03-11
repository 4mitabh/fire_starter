import 'package:cached_network_image/cached_network_image.dart';
import 'package:fire_starter/models/models.dart';
import 'package:fire_starter/services/storage_service.dart';
import 'package:fire_starter/ui/components/components.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImageUploadController extends GetxController {
  // final navMenuIndex = 0.obs;
}

class ImageUpload extends GetView {
  static Widget builder({required String path}) => GetBuilder<ImageUploadController>(
      init: ImageUploadController(),
      builder: (controller) => ImageUpload(
            controller,
            path: path,
          ));

  ImageUpload(ImageUploadController controller, {required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    print(path);
    return FutureBuilder<ListResult>(
        future: StorageService.list(path),
        builder: (context, ss) {
          if (!ss.hasData) return Text('...');
          return StaggeredGridView.countBuilder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: (ss.data?.items.length ?? 0) + 1,
            crossAxisCount: 4,
            staggeredTileBuilder: (int index) => index == 0 ? StaggeredTile.fit(4) : StaggeredTile.count(2, 2),
            itemBuilder: (_, index) {
              if (index == 0)
                return PrimaryButton(
                  onPressed: () => StorageService.packAndUpload(path: path),
                  labelText: "Upload",
                );
              return FBImage(ss.data?.items[index - 1]);
            },
          );
        });
  }
}

class FBImage extends StatelessWidget {
  final Reference? ref;
  const FBImage(this.ref);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ref?.getDownloadURL(),
        builder: (BuildContext context, AsyncSnapshot<String> urlSS) => urlSS.hasData ? CachedNetworkImage(imageUrl: urlSS.data) : Container());
  }
}
