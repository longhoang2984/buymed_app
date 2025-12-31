// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItemModel {
  CartItemModel({
    required this.productId,
    required this.qty,
    required this.name,
    required this.price,
  });

  final int qty;
  final String name;
  final double price;
  final int productId;

  CartItemModel copyWith({
    int? qty,
    String? name,
    double? price,
    int? productId,
  }) {
    return CartItemModel(
      qty: qty ?? this.qty,
      name: name ?? this.name,
      price: price ?? this.price,
      productId: productId ?? this.productId,
    );
  }
}
