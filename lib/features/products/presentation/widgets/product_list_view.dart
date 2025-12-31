import 'package:buymed_app/features/products/domain/entities/product_entity.dart';
import 'package:buymed_app/features/products/presentation/pages/controller.dart';
import 'package:buymed_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key, required this.controller});

  final ProductsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.isTrue
          ? Center(child: CircularProgressIndicator())
          : controller.filteredProducts.isEmpty
          ? Center(child: Text('Product Not Found'))
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSpacing.xs,
                crossAxisSpacing: AppSpacing.xs,
              ),
              padding: EdgeInsets.only(
                left: AppSpacing.sm,
                right: AppSpacing.sm,
                top: AppSpacing.sm,
                bottom: 200,
              ),
              itemCount: controller.filteredProducts.length,
              itemBuilder: (_, int idx) {
                ProductEntity product = controller.filteredProducts[idx];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const SizedBox(height: AppSpacing.lg),
                            Text(product.name, style: AppTypography.titleLarge),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              product.category,
                              style: AppTypography.bodyLarge.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 30,
                              child: Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      controller.decreaseCart(product: product);
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.textSecondary,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          AppSpacing.xs,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '–',
                                          style: AppTypography.bodyLarge,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      controller.addToCart(product: product);
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.textSecondary,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          AppSpacing.xs,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '+',
                                          style: AppTypography.bodyLarge,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: AppSpacing.sm),
                          ],
                        ),
                        if (product.isPrescription)
                          Positioned(
                            top: AppSpacing.xs,
                            right: 0,
                            child: Icon(Icons.medication),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
