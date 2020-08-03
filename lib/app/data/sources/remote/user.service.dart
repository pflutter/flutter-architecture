import 'package:flutter/material.dart';
import 'package:cpap_mobile/app/data/mappers/user.mapper.dart';
import 'package:cpap_mobile/app/domain/http_response.dart';
import 'package:cpap_mobile/core/di/http_client.dart';
import 'package:cpap_mobile/core/di/injector_provider.dart';

import './base/endpoints.dart' as Endpoints;

class UserService {
  HttpClient client = inject<HttpClient>();

  Future<HttpResponse> list() async {
    HttpResponse response = HttpResponse();

    final String url = Endpoints.myList.list;

    final ret = client.get(url);

    await ret.then((res) {
      response.statusCode = res.statusCode;
      response.data = UserMapper.fromJsonList(res.data);
      response.message = res.statusMessage;
    }).catchError((e) {
      response.statusCode = 500;
      response.data = e;
      response.message = "Server Error";
    });

    return response;
  }
}
