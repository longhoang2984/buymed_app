import 'package:buymed_app/features/products/domain/entities/product_entity.dart';

class ProductsModel {
  ProductsModel.fromJson(dynamic json) : data = _fromData(json);

  List<ProductModel> data;

  static List<ProductModel> _fromData(dynamic list) {
    return list is List<dynamic>
        ? list
              .whereType<Map<String, dynamic>>()
              .map(ProductModel.fromJson)
              .toList()
        : <ProductModel>[];
  }
}

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.category,
    required super.isPrescription,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'] as String? ?? '',
      price: json['price'] != null ? double.parse(json['price'].toString()) : 0,
      category: json['category'] as String? ?? '',
      isPrescription: json['isPrescription'] as bool? ?? false,
    );
  }

  ProductEntity toEntity() => ProductEntity(
    id: id,
    name: name,
    price: price,
    category: category,
    isPrescription: isPrescription,
  );
}
