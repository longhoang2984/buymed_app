import 'package:flutter_test/flutter_test.dart';
import 'package:buymed_app/features/products/data/repositories/product_repository_impl.dart';
import 'package:buymed_app/features/products/data/datasources/product_data_source.dart';
import 'package:buymed_app/features/products/data/models/product_model.dart';

class FakeDataSource implements ProductDataSource {
  final List<ProductModel> items;
  FakeDataSource(this.items);

  @override
  Future<List<ProductModel>> getProducts() async => items;
}

void main() {
  test('ProductRepositoryImpl delegates to data source', () async {
    final items = [
      ProductModel(id: 1, name: 'X', price: 10, category: 'c', isPrescription: false),
    ];
    final ds = FakeDataSource(items);
    final repo = ProductRepositoryImpl(dataSource: ds);

    final res = await repo.getProducts();
    expect(res.length, 1);
    expect(res.first.id, 1);
    expect(res.first.name, 'X');
  });
}
