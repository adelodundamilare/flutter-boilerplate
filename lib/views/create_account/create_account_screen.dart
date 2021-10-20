import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grigora/constants.dart';
import 'package:grigora/ui_widgets/buttons.dart';
import 'package:grigora/ui_widgets/layouts/simple_layout.dart';
import 'package:grigora/ui_widgets/project_text.dart';
import 'package:grigora/utils/base_widget.dart';
import 'package:grigora/utils/form_item.dart';
import 'package:grigora/utils/validators.dart';
import 'package:grigora/views/create_account/create_account_vm.dart';
import 'package:provider/provider.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    return BaseWidget<CreateAccountVM>(
        model: CreateAccountVM(_formKey),
        builder: (context, model, child) {
          return SimpleLayout(
              isLoading: model.isLoading,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProjectTextTitle('Create your account'),
                  _Form().paddingTop(kSpacingExtraLarge)
                ],
              ).paddingAll(kSpacingMedium));
        });
  }
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CreateAccountVM>(context);
    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormItem(
            placeholder: 'Firstname',
            onSaved: (val) => model.firstname = val!,
            validator: (val) => Validators.validateText(val),
          ),
          Divider(
            color: kColorDarkGrey,
          ),
          FormItem(
            placeholder: 'Lastname',
            onSaved: (val) => model.lastname = val!,
            validator: (val) => Validators.validateText(val),
          ),
          Divider(
            color: kColorDarkGrey,
          ),
          FormItem(
            placeholder: 'Phone',
            keyboardType: EnumKeyboardTpe.number,
            onSaved: (val) => model.phone = val!,
            validator: (val) => Validators.validatePhoneNumber(val),
          ),
          Divider(
            color: kColorDarkGrey,
          ),
          FormItem(
            placeholder: 'Email',
            onSaved: (val) => model.email = val!,
            keyboardType: EnumKeyboardTpe.email,
            validator: (val) => Validators.validateEmail(val),
          ),
          Divider(
            color: kColorDarkGrey,
          ),
          FormItem(
            placeholder: 'Password',
            onSaved: (val) => model.password = val!,
            password: true,
            validator: (val) => Validators.validateText(val),
          ).paddingTop(kSpacingMedium),
          Divider(
            color: kColorDarkGrey,
          ),
          ProjectText(
            'Password should be between 6 and 16 characters',
            textSize: kFontSizeSmall,
          ),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (val) => true,
                activeColor: kColorPrimary,
              ),
              ProjectText('Yes, I want to receive offers and discounts'),
            ],
          ).paddingTop(kSpacingMedium),
          ProjectButton(
            onTap: () => model.doCreateAccount(),
            text: 'Create your account',
            borderRadius: kBorderRadius,
          ).paddingTop(kSpacingMedium),
          ProjectText(
                  'By creating an account you agree to the privacy policy and to the terms of use')
              .paddingTop(kSpacingMedium)
        ],
      ),
    );
  }
}
