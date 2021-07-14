part of datasource;

abstract class ProductFormSource {
  String typeid = '';
  late bool isLoading;

  BsSelectBoxController selectType = BsSelectBoxController();

  TextEditingController inputCode = TextEditingController();
  TextEditingController inputName = TextEditingController();
  TextEditingController inputDescription = TextEditingController();
}

class ProductForm {
  ProductForm(this.context, this.presenter);

  final BuildContext context;

  final ProductPresenter presenter;

  Widget selectTypeId() {
    return BsFormGroup(
      label: Text(ProductText.formType),
      child: BsSelectBox(
        searchable: true,
        disabled: presenter.isLoading,
        hintText: DBText.placeholderSelect(ProductText.formType),
        selectBoxController: presenter.selectType,
        serverSide: (params) => selectType(params, typeid: presenter.typeid),
      ),
    );
  }
}