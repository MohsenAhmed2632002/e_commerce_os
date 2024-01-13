// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CartProdectModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartProductModelAdapter extends TypeAdapter<CartProductModel> {
  @override
  final int typeId = 0;

  @override
  CartProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProductModel(
      name: fields[0] as String,
      image: fields[1] as String,
      color: fields[3] as String,
      size: fields[2] as String,
      price: fields[5] as int,
      details: fields[4] as String,
      quan: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartProductModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.size)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.details)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.quan);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      name: json['name'] as String,
      image: json['image'] as String,
      color: json['color'] as String,
      size: json['size'] as String,
      price: json['price'] as int,
      details: json['details'] as String,
      quan: json['quan'] as int,
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'size': instance.size,
      'color': instance.color,
      'details': instance.details,
      'price': instance.price,
      'quan': instance.quan,
    };
