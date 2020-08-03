import 'package:cpap_mobile/app/domain/http_response.dart';
import 'package:cpap_mobile/app/domain/repositories/auth.repository.dart';
import 'package:cpap_mobile/core/di/injector_provider.dart';
import 'package:cpap_mobile/device/connection/connection.helper.dart';

import 'sources/remote/auth.service.dart';

class AuthRepository implements IAuthRepository {
  AuthService service = inject<AuthService>();

  @override
  Future<HttpResponse> login(String login, String senha) async {
    HttpResponse response = HttpResponse();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      response = await this.service.login(login, senha);
    } else {
      response.message = "Device offline";
    }

    return response;
  }
}
