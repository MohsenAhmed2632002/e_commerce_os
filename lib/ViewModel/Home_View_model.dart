import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_os/Models/CategoryModel.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];
  final CollectionReference _categoryRef =
      FirebaseFirestore.instance.collection("Categories");
  HomeViewModel() {
    getCategory();
  }
  getCategory() async {
 await   _categoryRef.get().then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        _categoryModel.add(
          CategoryModel.fromJson(
            value.docs[i].data() as Map<String, dynamic>,
          ),
        );
        print(_categoryModel.length);
      }
      print("object");
      update();
    });
  }
}
