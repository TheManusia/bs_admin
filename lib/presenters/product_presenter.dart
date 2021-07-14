import 'package:bs_admin/models/product_model.dart';
import 'package:bs_admin/services/product_service.dart';
import 'package:bs_admin/utils/utils.dart';
import 'package:bs_admin/views/masters/product/source/datasource.dart';
import 'package:bs_admin/views/masters/product/widget/product_form.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        productSource.onDeleteListener =
            (productid) => delete(context, productid);
        setLoading(false);
      }
    });
  }

  void add(BuildContext context) {
    resetData();
    setLoading(false);

    showDialog(
        context: context,
        builder: (context) => ProductFormModal(
              key: _formState,
              presenter: this,
              onSubmit: () => store(context),
            ));
  }

  void edit(BuildContext context, int productid) {}

  void delete(BuildContext context, int productid) {}

  void setLoading(bool bool) {
    isLoading = bool;
    viewContract.updateState();

    if (_formState.currentState != null)
      _formState.currentState!.setState(() {});
  }

  void resetData() {
    typeid = '';
    selectType.clear();
    inputCode.clear();
    inputName.clear();
    inputDescription.clear();
  }

  void store(BuildContext context) {
    setLoading(true);
    productService.store(getDatas()).then((value) {
      setLoading(false);
      if (value.result!) {
        Navigator.pop(context);
        productSource.controller.reload();
      }
    });
  }

  Map<String, String> getDatas() {
    return {
      'typeid': selectType.getSelectedAsString() != ''
          ? selectType.getSelectedAsString()
          : '0',
      'productcd': inputCode.text,
      'productnm': inputName.text,
      'description': inputDescription.text,
    };
  }
}
