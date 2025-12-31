import 'package:buymed_app/features/products/presentation/pages/controller.dart';
import 'package:buymed_app/features/products/presentation/widgets/bottom_quick_order_view.dart';
import 'package:buymed_app/features/products/presentation/widgets/product_list_view.dart';
import 'package:buymed_app/features/products/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends GetView<ProductsController> {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      init: ProductsController(Get.find(), Get.find()),
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              title: SearchField(controller: controller),
              automaticallyImplyLeading: false,
              titleSpacing: 0,
            ),
          ),
          body: SafeArea(bottom: false, child: _buildView()),
        );
      },
    );
  }

  Widget _buildView() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Expanded(child: ProductListView(controller: controller))],
        ),
        BottomQuickOrderView(controller: controller),
      ],
    );
  }
}
