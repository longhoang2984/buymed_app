import 'package:flutter_test/flutter_test.dart';
import 'package:buymed_app/features/products/data/models/product_model.dart';

void main() {
  test('ProductModel.fromJson parses values correctly', () {
    final json = {
      'id': 10,
      'name': 'Test',
      'price': 123.5,
      'category': 'cat',
      'isPrescription': true,
    };

    final model = ProductModel.fromJson(json);

    expect(model.id, 10);
    expect(model.name, 'Test');
    expect(model.price, 123.5);
    expect(model.category, 'cat');
    expect(model.isPrescription, true);
  });

  test('ProductsModel.fromJson handles list and non-list gracefully', () {
    final listJson = [
      {'id': 1, 'name': 'A', 'price': 1, 'category': 'c', 'isPrescription': false},
      {'id': 2, 'name': 'B', 'price': 2, 'category': 'c2', 'isPrescription': true},
    ];

    final model = ProductsModel.fromJson(listJson);
    expect(model.data.length, 2);
    expect(model.data.first.id, 1);

    final nonList = {'foo': 'bar'};
    final model2 = ProductsModel.fromJson(nonList);
    expect(model2.data, isEmpty);
  });
}
