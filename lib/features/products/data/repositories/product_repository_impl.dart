import 'package:buymed_app/features/products/data/datasources/product_data_source.dart';
import 'package:buymed_app/features/products/domain/entities/product_entity.dart';
import 'package:buymed_app/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl({required ProductDataSource dataSource})
    : _dataSource = dataSource;
  final ProductDataSource _dataSource;

  @override
  Future<List<ProductEntity>> getProducts() => _dataSource.getProducts();
}
