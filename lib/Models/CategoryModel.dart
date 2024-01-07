class CategoryModel {
  late String name, image;
  CategoryModel({
    required this.name,
    required this.image,
  });
  CategoryModel.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    } else {
      name = map["name"];
      image = map["image"];
    }
  }
  toJson() {
    return {
      "name": name,
      "image": image,
    };
  }
}
