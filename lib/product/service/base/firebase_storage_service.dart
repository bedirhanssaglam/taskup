import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  Future<List<String>> getImageUrls(List<String> imageNames) async {
    List<String> imageUrls = [];

    for (String imageName in imageNames) {
      String downloadUrl = await FirebaseStorage.instance.ref('images/$imageName.jpg').getDownloadURL();
      imageUrls.add(downloadUrl);
    }
    return imageUrls;
  }
}
