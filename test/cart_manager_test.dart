import 'package:flutter_test/flutter_test.dart';
import 'package:buymed_app/shared/cart.dart';
import 'package:buymed_app/features/products/domain/entities/product_entity.dart';

void main() {
  test('CartManager addToCart and decrease behavior', () {
    final cart = CartManager();
    final p = ProductEntity(
      id: 5,
      name: 'Prod',
      price: 10.0,
      category: 'c',
      isPrescription: false,
    );

    cart.addToCart(product: p, qty: 2);
    expect(cart.getProductQty(productId: 5), 2);

    cart.addToCart(product: p, qty: 3);
    expect(cart.getProductQty(productId: 5), 5);

    cart.decrease(product: p, qty: 2);
    expect(cart.getProductQty(productId: 5), 3);

    cart.decrease(product: p, qty: 5);
    expect(cart.getProductQty(productId: 5), 0);
  });
}
