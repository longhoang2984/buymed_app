import 'package:buymed_app/features/products/domain/entities/product_entity.dart';
import 'package:buymed_app/features/products/domain/repositories/product_repository.dart';
import 'package:buymed_app/shared/usecase.dart';

class GetProductsUsecase extends Usecase<List<ProductEntity>, void> {
  GetProductsUsecase({required ProductRepository productRepository})
    : _productRepository = productRepository;
  final ProductRepository _productRepository;

  @override
  Future<List<ProductEntity>> call({void param}) =>
      _productRepository.getProducts();
}
