import 'package:buymed_app/features/products/data/datasources/product_data_source.dart';
import 'package:buymed_app/features/products/data/repositories/product_repository_impl.dart';
import 'package:buymed_app/features/products/domain/repositories/product_repository.dart';
import 'package:buymed_app/features/products/domain/usecases/get_products_usecase.dart';
import 'package:buymed_app/shared/app_pages.dart';
import 'package:buymed_app/shared/cart.dart';
import 'package:buymed_app/shared/network/api_client.dart';
import 'package:buymed_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BUYMED Pharmacy',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      theme: createAppTheme(),
      initialBinding: BindingsBuilder(() {
        Get.put<ProductApiClient>(ProductApiClient());
        Get.put<CartManager>(CartManager());
        Get.lazyPut<ProductDataSource>(
          () => ProductDataSourceImpl(client: Get.find<ProductApiClient>()),
        );

        Get.lazyPut<ProductRepository>(
          () =>
              ProductRepositoryImpl(dataSource: Get.find<ProductDataSource>()),
        );

        Get.lazyPut<GetProductsUsecase>(
          () => GetProductsUsecase(
            productRepository: Get.find<ProductRepository>(),
          ),
        );
      }),
    );
  }
}
