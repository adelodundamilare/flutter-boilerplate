import 'package:flutter/material.dart';
import 'package:ProjectX/constants.dart';
import 'package:ProjectX/ui_widgets/buttons.dart';
import 'package:ProjectX/ui_widgets/project_text.dart';
import 'package:ProjectX/ui_widgets/ui_utils.dart';
import 'package:ProjectX/utils/base_widget.dart';
import 'package:ProjectX/views/login/login_vm.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginVM>(
      model: LoginVM(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            appBar: new AppBar(
              iconTheme: IconThemeData(color: kColorBlack),
              centerTitle: true,
              backgroundColor: kColorWhite,
              elevation: 0,
              actions: [_CheckOutAsGuest()],
            ),
            body: SafeArea(child: _LoginWidget()),
          ),
        );
      },
    );
  }
}

class _CheckOutAsGuest extends StatelessWidget {
  const _CheckOutAsGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => UiUtils.goto(kRouteOnboarding),
      child: ProjectText(
        'Checkout as guest',
        textColor: kColorPrimary,
        isBoldFont: true,
      ).paddingAll(kSpacingMedium),
    );
  }
}

class _LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            kImagesFingerPrint,
            width: 250,
          ),
        ),
        ProjectTextTitle('Log in or create an account')
            .paddingBottom(kSpacingMedium)
            .paddingTop(kSpacingMedium),
        ProjectText(
          'Login or create an account to recieve rewards and save your details for a faster checkout experience',
          centerText: true,
        ).paddingBottom(kSpacingMedium),
        ProjectButton(
          onTap: () => UiUtils.goto(kRouteOnboarding),
          text: 'Continue an account',
          withBg: true,
        ).paddingBottom(kSpacingMedium),
        ProjectButton(
          onTap: () => UiUtils.goto(kRouteOnboarding),
          text: 'Login',
        ).paddingBottom(kSpacingExtraLarge),
      ],
    );
  }
}

class SkipButtonText extends StatelessWidget {
  final bool isInactive;

  SkipButtonText({this.isInactive = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => UiUtils.goto(kRouteOnboarding),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'SKIP',
          style: TextStyle(
              color: isInactive ? kColorWhite : kColorBlack,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _AppTitleText extends StatelessWidget {
  final bool isActive;
  final String text;
  final Function() onTap;
  _AppTitleText(
      {this.isActive = false, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: isActive ? kColorBlack : kColorGrey,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: TextStyle(
              color: isActive ? kColorWhite : kColorBlack,
              fontWeight: FontWeight.bold,
              fontSize: kFontSizeMedium),
        ),
      ),
    );
  }
}
