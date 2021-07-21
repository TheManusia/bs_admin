import 'package:bs_admin/routes.dart';
import 'package:bs_admin/utils/session.dart';
import 'package:bs_admin/views/masters/product/widget/product.dart';
import 'package:fluro/fluro.dart';

class ProductRoute {
  static String routeKey = 'product';
  static String product = '/product';

  static void routes(Routes router) {
    router.define(product,
        handler: Handler(
          handlerFunc: (context, params) => Session(
            builder: (context) async {
              return ProductView();
            },
          ),
        ));
  }
}
