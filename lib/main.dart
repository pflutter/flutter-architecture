import 'package:flutter/material.dart';
import 'package:cpap_mobile/core/app.dart';
import 'package:cpap_mobile/core/di/injector_provider.dart';

void main() async {
  setupInjection();
  runApp(App());
}
