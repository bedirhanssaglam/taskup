import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  Future<List<String>> getImageUrls(List<String> imageNames) async {
    final imageUrls = <String>[];

    for (final imageName in imageNames) {
      final downloadUrl = await FirebaseStorage.instance
          .ref('images/$imageName.jpg')
          .getDownloadURL();
      imageUrls.add(downloadUrl);
    }
    return imageUrls;
  }
}
