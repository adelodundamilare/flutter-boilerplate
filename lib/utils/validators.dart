class Validators {
  var zipCodeRegExp = RegExp(r'^[0-9]{5}(?:-[0-9]{4})?$');

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";

    final _emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (!_emailRegExp.hasMatch(value.trim())) {
      return 'Invalid email';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) return "Phone number is required";

    var _phoneNumberRegExp = RegExp(
        r'^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$');
    if (!_phoneNumberRegExp.hasMatch(value.trim())) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? validateText(String? value) {
    if (value == null || value.isEmpty) return "Input is required";
    return null;
  }
}
