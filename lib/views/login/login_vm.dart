import 'package:ProjectX/utils/base_model.dart';

class LoginVM extends BaseModel {
  // is sign in
  bool _isSignin = false;
  bool get isSignin => _isSignin;
  set isSignin(bool value) {
    _isSignin = value;
    notifyListeners();
  }
}
