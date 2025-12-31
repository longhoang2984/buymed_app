import 'package:buymed_app/features/products/presentation/pages/page.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages();

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: '/',
      transition: Transition.fadeIn,
      page: () => const ProductsPage(),
    ),
  ];
}
