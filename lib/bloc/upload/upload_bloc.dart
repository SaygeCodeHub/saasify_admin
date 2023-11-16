import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saasify/bloc/upload/upload_events.dart';
import 'package:saasify/bloc/upload/upload_states.dart';
import 'package:saasify/data/models/upload/upload_image_model.dart';
import 'package:saasify/repositories/upload/upload_repository.dart';
import '../../di/app_module.dart';

class UploadBloc extends Bloc<UploadEvents, UploadStates> {
  final UploadRepository _uploadRepository = getIt<UploadRepository>();

  List<XFile> pickedFiles = [];
  List pickedImageList = [];
  UploadStates get initialState => UploadImageInitial();

  UploadBloc() : super(UploadImageInitial()) {
    on<UploadImage>(_uploadImage);
    on<PickImage>(_pickImage);
    on<RemoveImage>(_removeImage);
  }

  Future _pickImage(PickImage event, Emitter<UploadStates> emit) async {
    if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      List<XFile> image = await picker.pickMultiImage();
      if (image.isNotEmpty) {
        pickedFiles.clear();
        pickedFiles.addAll(image);
        for (var item in image) {
          Uint8List image1 = await item.readAsBytes();
          pickedImageList.add(image1);
        }
        emit(ImagePicked());
      } else {
        emit(ImageCouldNotPick(imageNotPicked: 'Something went Wrong'));
      }
    }
  }

  Future<void> _uploadImage(
      UploadImage event, Emitter<UploadStates> emit) async {
    emit(UploadImageLoading());
    try {
      UploadImageModel uploadImageModel =
          await _uploadRepository.uploadImage(event.multiplePartFileList);
      if (uploadImageModel.status == 200) {
        emit(UploadImageLoaded(uploadImageModel: uploadImageModel));
      } else {
        emit(UploadImageError(message: uploadImageModel.message));
      }
    } catch (e) {
      emit(UploadImageError(message: e.toString()));
    }
  }

  FutureOr<void> _removeImage(
      RemoveImage event, Emitter<UploadStates> emit) async {
    emit(ImagePicked());
  }
}
