import 'package:flutter/cupertino.dart';
import 'package:grigora/services/auth_services.dart';
import 'package:grigora/ui_widgets/ui_utils.dart';
import 'package:grigora/utils/base_model.dart';
import 'package:grigora/utils/locator.dart';
import 'package:grigora/utils/log_printer.dart';
import 'package:grigora/services/hardware_info_service.dart';

class CreateAccountVM extends BaseModel {
  final logger = getLogger("create_account_vm.dart");
  final GlobalKey<FormState> formKey;
  //
  final _authService = locator<AuthServices>();
  final _hardareInfoService = locator<HardwareInfoService>();

  CreateAccountVM(this.formKey);

  // firstname
  String _firstname = "";
  String get firstname => _firstname;
  set firstname(String value) {
    _firstname = value;
    notifyListeners();
  }

  // lastname
  String _lastname = "";
  String get lastname => _lastname;
  set lastname(String value) {
    _lastname = value;
    notifyListeners();
  }

  // email
  String _email = "";
  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

// @todo: compute country
  // phone
  String _phone = "";
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
    notifyListeners();
  }

  // password
  String _password = "";
  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> doCreateAccount() async {
    if (!formKey.currentState!.validate()) return;

    formKey.currentState!.save();
    _hardareInfoService.init();

    try {
      isLoading = true;
      dynamic res = await _authService.doRegister({
        "email": email,
        "password": password,
        "name": firstname + ' ' + lastname,
        "phone": phone,
        "country_code": "234",
        "device_id": _hardareInfoService.udid
      });
      // ModelRegister parsedRes = ModelRegister.fromJson(res);
      // UiUtils.showSnackbar(parsedRes.message ?? 'Account created successfully');
    } catch (error) {
      logger.e(error.toString());
      UiUtils.showSimpleDialog(
          title: 'Failed',
          message: error.toString(),
          onOkPressed: () => UiUtils.goBack());
    } finally {
      isLoading = false;
    }
  }
}
