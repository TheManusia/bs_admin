import 'package:bs_admin/models/product_model.dart';
import 'package:bs_admin/services/product_service.dart';
import 'package:bs_admin/utils/utils.dart';
import 'package:bs_admin/views/masters/product/source/datasource.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductPresenterContract implements ViewContract {}

class ProductPresenter extends ProductFormSource {
  GlobalKey<State> _formState = GlobalKey<State>();

  final ProductPresenterContract viewContract;

  ProductPresenter(this.viewContract);

  ProductService productService = ProductService();
  ProductModel productModel = ProductModel();

  ProductDataSource productSource = ProductDataSource();

  Future datatables(BuildContext context, Map<String, String> params) async {
    return await productService.datatables(params).then((value) {
      if (value.result!) {
        productSource.response = BsDatatableResponse.createFromJson(value.data);
        productSource.onEditListener = (productid) => edit(context, productid);
        productSource.onDeleteListener = (productid) => delete(context, productid);
      }
    });
  }

  void edit(BuildContext context, int productid) {}

  void delete(BuildContext context, int productid) {}
}
