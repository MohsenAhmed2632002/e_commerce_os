import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_os/Models/UserModel.dart';

class FireSoterUser {
  final CollectionReference collectionUser =
      FirebaseFirestore.instance.collection("Users");
  Future addUserToFireStore(UserModel userModel) async {
    return await collectionUser.doc(userModel.userId).set(
          userModel.toJson(),
        );
  }

  Future<DocumentSnapshot> getCurrentUser(String uid)async {
    return await collectionUser.doc(uid).get();
  }
}
