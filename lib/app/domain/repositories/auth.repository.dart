import 'package:cpap_mobile/app/domain/http_response.dart';

abstract class IAuthRepository {
  Future<HttpResponse> login(String login, String senha);
}
