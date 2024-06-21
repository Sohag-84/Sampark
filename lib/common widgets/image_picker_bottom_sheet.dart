import 'package:image_picker/image_picker.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/image_picker.dart';

Future<dynamic> imagePickerBottomSheet({
  required BuildContext context,
  required RxString imagePath,
  required ImagePickerController imagePickController,
}) {
  return Get.bottomSheet(
    Container(
      height: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ///pick image from camera
          InkWell(
            onTap: () async {
             imagePath.value =
                  await imagePickController.pickImage(
                source: ImageSource.camera,
              );
              Get.back();
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.camera,
                size: 35,
              ),
            ),
          ),

          ///pick image from gallery
          InkWell(
            onTap: () async {
              imagePath.value =
                  await imagePickController.pickImage(
                source: ImageSource.gallery,
              );
              Get.back();
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.photo_camera_back,
                size: 35,
              ),
            ),
          ),

          ///pick video
          InkWell(
            onTap: () {},
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.play_arrow,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
