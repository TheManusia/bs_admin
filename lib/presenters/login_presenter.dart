import 'package:bs_admin/models/user_model.dart';
import 'package:bs_admin/routes.dart';
import 'package:bs_admin/routes/home_route.dart';
import 'package:bs_admin/services/auth_service.dart';
import 'package:bs_admin/utils/session.dart';
import 'package:bs_admin/utils/utils.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginPresenterContract implements ViewContract {}

class LoginPresenter {
  final LoginPresenterContract contract;

  LoginPresenter(this.contract);

  AuthService authService = AuthService();

  bool isLoading = false;

  TextEditingController inputUsername = TextEditingController();
  TextEditingController inputPassword = TextEditingController();

  String? errorMessage;

  void setLoading(bool loading) {
    isLoading = loading;
    contract.updateState();

    if (loading) errorMessage = null;
  }

  void login(BuildContext context) {
    try {
      setLoading(true);
      authService
          .login(username: inputUsername.text, password: inputPassword.text)
          .then((value) {
        if (value.result!) {
          UserModel user = UserModel.fromJson(value.data);
          SessionUtils session = SessionUtils(
              fullname: user.fullname, userid: user.id, token: user.token);
          SessionUtils.setSession(session);
          Routes.redirect(context, HomeRoute.home);
        } else {
          errorMessage = value.message;
          setLoading(false);
        }
      });
    } catch (e) {
      setLoading(false);
    }
  }
}
