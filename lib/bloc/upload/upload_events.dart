import 'package:image_picker/image_picker.dart';

abstract class UploadEvents {}

class UploadImage extends UploadEvents {
  final List<XFile> multiplePartFileList;

  UploadImage({required this.multiplePartFileList});
}

class PickImage extends UploadEvents {}

class RemoveImage extends UploadEvents {}
