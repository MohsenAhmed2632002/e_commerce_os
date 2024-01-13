import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'CartProdectModel.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(createToJson: true)
class CartProductModel {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String image;
  @HiveField(2)
  late String size;
  @HiveField(3)
  late String color;
  @HiveField(4)
  late String details;
  @HiveField(5)
  late int price;
  @HiveField(6)
  late int quan;
  CartProductModel({
    required this.name,
    required this.image,
    required this.color,
    required this.size,
    required this.price,
    required this.details,
    required this.quan,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);



  @override
  List<Object?> get props => [
        name,
        image,
        color,
        size,
        price,
        details,
        quan,
      ];
}
