import 'package:buymed_app/features/products/presentation/pages/controller.dart';
import 'package:buymed_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomQuickOrderView extends StatelessWidget {
  const BottomQuickOrderView({super.key, required this.controller});

  final ProductsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 250),
          opacity: controller.totalSku.value > 0 ? 1 : 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: AppColors.textSecondary,
                  spreadRadius: 0.3,
                  blurRadius: 0.4,
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        const Spacer(),
                        Text('Total SKUs:', style: AppTypography.labelLarge),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          '${controller.totalSku.value}',
                          style: AppTypography.bodyLarge,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          'Total Quantity:',
                          style: AppTypography.labelLarge,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          '${controller.totalQty.value}',
                          style: AppTypography.bodyLarge,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text('Total Amount:', style: AppTypography.labelLarge),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          controller.totalAmount.value.toStringAsFixed(0),
                          style: AppTypography.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
