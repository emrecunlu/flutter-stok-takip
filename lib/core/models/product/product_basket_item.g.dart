// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_basket_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductBasketItemAdapter extends TypeAdapter<ProductBasketItem> {
  @override
  final int typeId = 4;

  @override
  ProductBasketItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductBasketItem(
      product: fields[0] as ProductModel,
      quantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductBasketItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.product)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductBasketItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
