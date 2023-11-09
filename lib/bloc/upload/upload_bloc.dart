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

  UploadStates get initialState => UploadImageInitial();

  UploadBloc() : super(UploadImageInitial()) {
    on<UploadImage>(_uploadImage);
    on<PickImage>(_pickImage);
  }

  Future _pickImage(PickImage event, Emitter<UploadStates> emit) async {
    if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      List<XFile> image = await picker.pickMultiImage();
      final List<XFile> multipartFile = [];
      List<Uint8List> pickedImageList = [];
      if (image.isNotEmpty) {
        multipartFile.addAll(image);
        for (var item in image) {
          Uint8List image1 = await item.readAsBytes();
          pickedImageList.add(image1);
        }
        emit(ImagePicked(pickedImageList: pickedImageList));
      } else {
        if (kDebugMode) {
          print('No Image selected');
        }
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
}
