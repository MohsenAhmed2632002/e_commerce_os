import 'package:e_commerce_os/Models/CategoryModel.dart';
import 'package:e_commerce_os/Models/ProdectModel.dart';
import 'package:e_commerce_os/core/utils/service.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];
  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];
  HomeViewModel() {
    getCategory();
    getBestSelling();
  }
  getCategory() async {
    HomeService().getCategories().then((value) {
      for (var i = 0; i < value.length; i++) {
        _categoryModel.add(
          CategoryModel.fromJson(
            value[i].data() as Map<String, dynamic>,
          ),
        );
      }
      update();
    });
  }

  getBestSelling() async {
    HomeService().getProducts().then((value) {
      for (var i = 0; i < value.length; i++) {
        _productModel.add(
          ProductModel.fromJson(
            value[i].data() as Map<String, dynamic>,
          ),
        );
      }

      update();
    });
  }
}
