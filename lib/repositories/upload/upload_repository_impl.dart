import 'package:image_picker/image_picker.dart';
import 'package:saasify/data/models/upload/upload_image_model.dart';
import 'package:saasify/repositories/upload/upload_repository.dart';
import 'package:saasify/services/client_services.dart';

class UploadRepositoryImpl extends UploadRepository {
  @override
  Future<UploadImageModel> uploadImage(List<XFile> multiplePartFileList) async {
    final response = await ClientServices().multiPart('', multiplePartFileList);
    return UploadImageModel.fromJson(response);
  }
}
