import 'dart:typed_data';
import 'package:saasify/data/models/upload/upload_image_model.dart';

abstract class UploadStates {}

class UploadImageInitial extends UploadStates {}

class UploadImageLoading extends UploadStates {}

class UploadImageLoaded extends UploadStates {
  final UploadImageModel uploadImageModel;

  UploadImageLoaded({required this.uploadImageModel});
}

class UploadImageError extends UploadStates {
  final String message;

  UploadImageError({required this.message});
}

class ImagePicked extends UploadStates {
  final List<Uint8List> pickedImageList;

  ImagePicked({required this.pickedImageList});
}

class ImageCouldNotPick extends UploadStates {
  final String imageNotPicked;

  ImageCouldNotPick({required this.imageNotPicked});
}
