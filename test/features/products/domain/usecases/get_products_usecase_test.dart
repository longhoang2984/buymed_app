import 'package:flutter_test/flutter_test.dart';
import 'package:buymed_app/features/products/domain/usecases/get_products_usecase.dart';
import 'package:buymed_app/features/products/domain/repositories/product_repository.dart';
import 'package:buymed_app/features/products/domain/entities/product_entity.dart';

class FakeProductRepository implements ProductRepository {
  final List<ProductEntity> products;
  FakeProductRepository(this.products);

  @override
  Future<List<ProductEntity>> getProducts() async => products;
}

class ThrowingRepository implements ProductRepository {
  @override
  Future<List<ProductEntity>> getProducts() async => throw Exception('fetch failed');
}

void main() {
  test('GetProductsUsecase returns products from repository', () async {
    final products = [
      ProductEntity(id: 1, name: 'A', price: 1.0, category: 'cat', isPrescription: false),
      ProductEntity(id: 2, name: 'B', price: 2.0, category: 'cat2', isPrescription: true),
    ];

    final repo = FakeProductRepository(products);
    final usecase = GetProductsUsecase(productRepository: repo);

    final result = await usecase();

    expect(result, products);
  });

  test('GetProductsUsecase propagates exceptions from repository', () async {
    final repo = ThrowingRepository();
    final usecase = GetProductsUsecase(productRepository: repo);

    expect(() async => await usecase(), throwsA(isA<Exception>()));
  });
}
