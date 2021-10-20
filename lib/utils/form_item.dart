import 'package:flutter/material.dart';
import 'package:ProjectX/constants.dart';
import 'package:ProjectX/ui_widgets/project_text.dart';
import 'package:ProjectX/utils/base_model.dart';
import 'package:ProjectX/utils/base_widget.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:nb_utils/nb_utils.dart';

enum EnumKeyboardTpe { email, number }

class FormItem extends StatelessWidget {
  final String? placeholder, intialValue, label;
  final Key? key;
  final Widget? icon;
  final bool? password;
  final bool lastFormItem;
  final bool isMultiline;
  final bool withNoBorder;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final EnumKeyboardTpe? keyboardType;

  FormItem({
    this.key,
    this.placeholder,
    this.icon,
    this.password = false,
    this.lastFormItem = false,
    this.withNoBorder = false,
    this.focusNode,
    this.intialValue,
    this.label,
    this.isMultiline = false,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.onFieldSubmitted,
  }) : super(key: key);

  TextInputType _computeInputType(EnumKeyboardTpe? type) {
    switch (type) {
      case EnumKeyboardTpe.email:
        return TextInputType.emailAddress;
      case EnumKeyboardTpe.number:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<_InputFieldVM>(
        model: _InputFieldVM(),
        builder: (context, model, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectTextTitle(
                label ?? '',
                textSize: kFontSizeMedium,
              ).paddingBottom(kSpacingSmall).visible(label is String),
              TextFormField(
                key: key,
                obscureText: password is bool && password == true && model.show
                    ? true
                    : false,
                validator: validator,
                focusNode: focusNode,
                initialValue: intialValue,
                maxLines: isMultiline ? null : 1,
                textInputAction:
                    lastFormItem ? TextInputAction.done : TextInputAction.next,
                keyboardType: _computeInputType(keyboardType),
                onSaved: onSaved,
                onFieldSubmitted: onSaved,
                style: TextStyle(
                    color: kColorBlack,
                    fontSize: kFontSizeLarge,
                    fontFamily: kFontFamilyRegular),
                decoration: InputDecoration(
                    border: withNoBorder
                        ? InputBorder.none
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                                color: kColorGrey,
                                style: BorderStyle.none,
                                width: 2),
                            borderRadius: kBorderRadius,
                          ),
                    hintText: placeholder,
                    suffixIcon: password is bool && password == true
                        ? InkWell(
                            onTap: () => model.show = !model.show,
                            child: _ShowPasswordWidget(
                              show: model.show,
                            ),
                          )
                        : null,
                    hintStyle: TextStyle(fontSize: kFontSizeMedium)),
              ),
            ],
          );
        });
  }
}

class _InputFieldVM extends BaseModel {
  // show
  bool _show = true;
  bool get show => _show;
  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}

class _ShowPasswordWidget extends StatelessWidget {
  final bool show;
  _ShowPasswordWidget({this.show = false});
  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 2,
      child: ProjectText(
        show ? 'Show' : 'Hide',
        textColor: kColorPrimary,
        textSize: kFontSizeSmall,
        isBoldFont: true,
      ),
    );
  }
}

class FormItemOTP extends StatefulWidget {
  final Function(String) callback;
  final String? Function(String?)? validator;

  const FormItemOTP({
    Key? key,
    required this.callback,
    required this.validator,
  }) : super(key: key);

  @override
  _FormItemOTPState createState() => _FormItemOTPState();
}

class _FormItemOTPState extends State<FormItemOTP> {
  final int _length = 6;
  String _pin = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OTPTextField(
          length: _length,
          width: kWidthFull(context),
          fieldWidth: 50,
          style: TextStyle(fontSize: 17),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
            setState(() {
              _pin = pin;
            });
            widget.callback(pin);
          },
        ),
        SizedBox(
          // height: 10,
          child: FormItem(
            intialValue: _pin,
            validator: widget.validator,
          ),
        ).paddingTop(kSpacingMedium)
      ],
    );
  }
}
