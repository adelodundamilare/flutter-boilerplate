import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ProjectX/constants.dart';
import 'package:ProjectX/ui_widgets/buttons.dart';
import 'package:ProjectX/ui_widgets/project_text.dart';
import 'package:ProjectX/utils/form_item.dart';
import 'package:nb_utils/nb_utils.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kColorBlack),
        backgroundColor: kColorWhite,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectTextTitle('Forgot password'),
          _Form().paddingTop(kSpacingMedium)
        ],
      ).paddingAll(kSpacingMedium),
    );
  }
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      // key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormItem(placeholder: 'Email'),
          Divider(
            color: kColorDarkGrey,
          ),
          ProjectButton(
            onTap: () => print('do nothing'),
            text: 'Reset your password',
            borderRadius: kBorderRadius,
          ).paddingTop(kSpacingMedium),
        ],
      ),
    );
  }
}
