import 'package:flutter/material.dart';
import 'package:cpap_mobile/app/ui/modules/unauthenticated/login/login.page.dart';
import 'package:cpap_mobile/core/values/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false, theme: appTheme, home: LoginPage());
}
