import 'package:buymed_app/features/products/domain/entities/cart_item_model.dart';
import 'package:buymed_app/features/products/domain/entities/product_entity.dart';
import 'package:buymed_app/features/products/domain/usecases/get_products_usecase.dart';
import 'package:buymed_app/shared/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  ProductsController(this._usecase, this._cartManager);

  final GetProductsUsecase _usecase;
  final CartManager _cartManager;
  final RxList<ProductEntity> products = RxList<ProductEntity>();
  final RxList<ProductEntity> filteredProducts = RxList<ProductEntity>();
  final RxList<String> categories = RxList<String>(['All']);
  final RxString selectedCat = RxString('All');
  final RxString searchKeyword = RxString('');
  final RxBool isLoading = RxBool(false);
  final searchTextFieldController = TextEditingController();
  final RxInt totalSku = RxInt(0);
  final RxInt totalQty = RxInt(0);
  final RxDouble totalAmount = RxDouble(0);

  @override
  void onInit() {
    super.onInit();
    _getData();
    _getCartData();

    debounce(
      searchKeyword,
      (value) {
        performFilter(value);
      },
      time: Duration(milliseconds: 200), // The debounce time
    );

    // Manually update the RxString from the TextEditingController's listener
    searchTextFieldController.addListener(() {
      searchKeyword.value = searchTextFieldController.text;
    });
  }

  void _getCartData() {
    totalSku.value = _cartManager.carts.keys.length;
    if (_cartManager.carts.isNotEmpty) {
      totalQty.value = _cartManager.carts.values
          .map((CartItemModel c) => c.qty)
          .reduce((v, c) => v + c);
      totalAmount.value = _cartManager.carts.values
          .map((CartItemModel c) => c.price * c.qty)
          .reduce((v, c) => v + c);
    } else {
      totalQty.value = 0;
      totalAmount.value = 0;
    }
  }

  Future<void> _getData() async {
    isLoading.toggle();
    try {
      List<ProductEntity> data = await _usecase();
      categories.addAll(data.map((ProductEntity e) => e.category).toList());
      products.value = data;
      performFilter(searchKeyword.value);
    } finally {
      isLoading.toggle();
    }
  }

  void changeCat(String cat) {
    selectedCat.value = cat;
    performFilter(searchKeyword.value);
  }

  void addToCart({required ProductEntity product, int qty = 1}) {
    _cartManager.addToCart(product: product, qty: qty);
    _getCartData();
  }

  void decreaseCart({required ProductEntity product, int qty = 1}) {
    _cartManager.decrease(product: product, qty: qty);
    _getCartData();
  }

  void performFilter(String query) {
    List<ProductEntity> temp = <ProductEntity>[];
    if (selectedCat.value == 'All') {
      temp = products;
    } else {
      temp = products
          .where((ProductEntity e) => e.category == selectedCat.value)
          .toList();
    }

    if (query.isNotEmpty) {
      temp = temp
          .where(
            (ProductEntity e) =>
                e.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }

    filteredProducts.value = temp;
  }
}
