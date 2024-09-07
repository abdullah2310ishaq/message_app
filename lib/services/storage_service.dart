import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  StorageService() {}

  Future<String?> uploadUserPfp({
    required File file,
    required String uid,
  }) async {
    Reference fileRef = _firebaseStorage
        .ref('users/pfps')
        .child('$uid${p.extension(file.path)}');
    UploadTask task = fileRef.putFile(file);

    return task.then((p) async {
      if (p.state == TaskState.success) {
        return await fileRef.getDownloadURL();
      }
      return null; // Return null if the upload wasn't successful
    }).catchError((error) {
      // Handle any errors
      print('Error during user profile picture upload: $error');
      return null; // Return null in case of an error
    });
  }

  Future<String?> uploadImageToChat({
    required File file,
    required String chatID,
  }) async {
    Reference fileRef = _firebaseStorage
        .ref('chats/$chatID')
        .child('${DateTime.now().toIso8601String()}${p.extension(file.path)}');
    UploadTask task = fileRef.putFile(file);

    return task.then((p) async {
      if (p.state == TaskState.success) {
        return await fileRef.getDownloadURL();
      }
      return null; // Return null if the upload wasn't successful
    }).catchError((error) {
      // Handle any errors
      print('Error during chat image upload: $error');
      return null; // Return null in case of an error
    });
  }
}
