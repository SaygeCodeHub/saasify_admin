// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_products_by_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryWithProductsDatumAdapter
    extends TypeAdapter<CategoryWithProductsDatum> {
  @override
  final int typeId = 4;

  @override
  CategoryWithProductsDatum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryWithProductsDatum(
      categoryId: fields[0] as int,
      categoryName: fields[1] as String,
      categoryImage: fields[2] as String,
      products: (fields[3] as List).cast<Product>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryWithProductsDatum obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.categoryId)
      ..writeByte(1)
      ..write(obj.categoryName)
      ..writeByte(2)
      ..write(obj.categoryImage)
      ..writeByte(3)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryWithProductsDatumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 3;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      productId: fields[0] as int,
      productName: fields[1] as String,
      details: fields[2] as String,
      variants: (fields[3] as List).cast<Variant>(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.details)
      ..writeByte(3)
      ..write(obj.variants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VariantAdapter extends TypeAdapter<Variant> {
  @override
  final int typeId = 2;

  @override
  Variant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Variant(
      variantId: fields[0] as int,
      variantCost: fields[1] as double,
      count: fields[2] as int,
      brandName: fields[3] as String,
      discountedCost: fields[4] as double,
      discount: fields[5] as int,
      quantity: fields[6] as String,
      description: fields[7] as String,
      image: (fields[8] as List).cast<String>(),
      ratings: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Variant obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.variantId)
      ..writeByte(1)
      ..write(obj.variantCost)
      ..writeByte(2)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.brandName)
      ..writeByte(4)
      ..write(obj.discountedCost)
      ..writeByte(5)
      ..write(obj.discount)
      ..writeByte(6)
      ..write(obj.quantity)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.ratings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
