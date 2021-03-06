import 'package:flutter/material.dart';
import 'package:cpap_mobile/app/ui/modules/authenticated/home/home.page.dart';
import 'package:cpap_mobile/app/ui/widgets/button.dart';
import 'package:cpap_mobile/app/ui/widgets/input.dart';
import 'package:cpap_mobile/app/ui/widgets/logo.dart';
import 'package:cpap_mobile/app/ui/widgets/snackbar.dart';
import 'package:cpap_mobile/app/ui/widgets/text.dart';
import 'package:cpap_mobile/core/di/injector_provider.dart';
import 'package:cpap_mobile/core/values/dimens.dart' as dimens;
import 'package:cpap_mobile/device/nav/nav_slide_from_top.dart';

import 'login.viewmodel.dart';

class LoginWidget {
  final vm = inject<LoginViewModel>();

  Widget form(BuildContext context, GlobalKey<ScaffoldState> key) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            LogoWidget(),
            SizedBox(height: 20),
            StreamBuilder(
                stream: vm.login,
                builder: (context, snapshot) {
                  return InputWidget(
                    placeholder: "username",
                    value: snapshot.data,
                    onChange: (value) => vm.setLogin(value),
                  );
                }),
            SizedBox(height: 10),
            StreamBuilder(
                stream: vm.password,
                builder: (context, snapshot) {
                  return InputWidget(
                    placeholder: "password",
                    value: snapshot.data,
                    password: true,
                    onChange: (value) => vm.setPassword(value),
                  );
                }),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () => print("forgot password click"),
                  child: TextWidget(
                    text: "forgot password?",
                    small: true,
                  ),
                )),
            SizedBox(height: 12),
            ButtonWidget(
                label: "login",
                onPress: () async {
                  final ret = await vm.signIn();

                  if (ret) {
                    SnackbarWidget(key, message: "SUCCESS");
                  } else {
                    SnackbarWidget(key,
                        error: true,
                        message: "NOT FOUND",
                        actionMessage: "OK", action: () {
                      print("ACTION CLICKED");
                    });
                  }

                  await Future.delayed(Duration(seconds: 1));
                  if (ret) {
                    Navigator.pushReplacement(
                        context, NavSlideFromTop(page: HomePage()));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
