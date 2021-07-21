part of utils;

class UtilsValidation {
  static BsInputValidator inputRequired(String field) {
    return BsInputValidator(validator: (value) {
      String valueValidate = value.toString().trim();
      if (valueValidate.isEmpty || value == null)
        return DBText.inputRequired(field);

      return null;
    });
  }

  static BsSelectValidator selectRequired(String field) {
    return BsSelectValidator(validator: (value) {
      String valueValidate = value.toString().trim();
      if (valueValidate.isEmpty || value == null)
        return DBText.inputRequired(field);

      return null;
    });
  }
}
