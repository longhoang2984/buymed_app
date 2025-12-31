import 'package:buymed_app/features/products/data/models/product_model.dart';
import 'package:buymed_app/shared/network/api_client.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductDataSourceImpl extends ProductDataSource {
  ProductDataSourceImpl({required ProductApiClient client}) : _client = client;
  final ProductApiClient _client;

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      dynamic response = await _client.get('/products');

      ProductsModel model = ProductsModel.fromJson(response);

      return model.data;
    } catch (_) {
      rethrow;
    }
  }
}
