import 'package:bs_admin/routes.dart';
import 'package:bs_admin/utils/session.dart';
import 'package:bs_admin/views/masters/types/widget/type.dart';
import 'package:fluro/fluro.dart';

class TypeRoute {
  static String routeKey = 'user';
  static String user = '/user';

  static void routes(Routes router) {
    router.define(user,
        handler: Handler(
          handlerFunc: (context, params) => Session(
            builder: (context) async {
              return TypeView();
            },
          ),
        ));
  }
}
