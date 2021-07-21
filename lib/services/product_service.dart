import 'package:bs_admin/utils/config.dart';
import 'package:bs_admin/utils/session.dart';
import 'package:http_repository/http_repository.dart';

class ProductService extends RepositoryCRUD {
  @override
  String get api => '${Config.api}/product';

  @override
  Future<String> get credentials async =>
      "Bearer ${await SessionUtils.getSession(SessionCode.token)}";
}
