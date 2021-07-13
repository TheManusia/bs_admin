import 'package:bs_admin/routes/masters/product_route.dart';
import 'package:bs_admin/views/skins/wrapper.dart';
import 'package:flutter/widgets.dart';

class ProductView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductViewState();
  }
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      menuKey: ProductRoute.routeKey,
      child: Text('Hello World'),
    );
  }
}
