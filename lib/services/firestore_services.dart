import 'package:ecommerce/const/firebase_consts.dart';

class FirestoreServices {
  //get users data

  static getUSer(uid) {
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
