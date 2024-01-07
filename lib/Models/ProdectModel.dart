class ProductModel {
  late String name, image, size, color, details;
  late int price;
  ProductModel(
      {required this.name,
      required this.image,
      required this.color,
      required this.size,
      required this.price,
      required this.details});
  ProductModel.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    } else {
      name = map["name"];
      image = map["image"];
      color = map["color"];
      size = map["size"];
      image = map["image"];
      details = map["details"];
      price = map["price"];
    }
  }
  toJson() {
    return {
      "name": name,
      "image": image,
      "color": color,
      "size": size,
      "price": price,
      "details": details,
    };
  }
}
