import 'package:buymed_app/features/products/domain/entities/cart_item_model.dart';
import 'package:buymed_app/features/products/domain/entities/product_entity.dart';

class CartManager {
  int min = 0;
  int max = 99;

  Map<int, CartItemModel> carts = <int, CartItemModel>{};

  int getProductQty({required int productId}) {
    return carts[productId]?.qty ?? 0;
  }

  void addToCart({required ProductEntity product, required int qty}) {
    CartItemModel? item = carts[product.id];
    if (item != null) {
      int curQty = item.qty;
      curQty = curQty + qty > max ? max : curQty + qty;
      item = item.copyWith(qty: curQty);
      carts[product.id] = item;
    } else {
      carts[product.id] = CartItemModel(
        productId: product.id,
        qty: qty,
        name: product.name,
        price: product.price,
      );
    }
  }

  void decrease({required ProductEntity product, required int qty}) {
    CartItemModel? item = carts[product.id];
    if (item != null) {
      int curQty = item.qty;
      if (curQty - qty <= min) {
        carts.remove(product.id);
      } else {
        carts[product.id] = item.copyWith(qty: curQty - qty);
      }
    }
  }
}
