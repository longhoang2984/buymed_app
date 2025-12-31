class ProductEntity {
  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.isPrescription,
  });
  
  final int id;
  final String name;
  final double price;
  final String category;
  final bool isPrescription;
}
