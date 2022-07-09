class Validations {
  static String? validateEmail(String value, {name = "Email is required."}) {
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value.trim().isEmpty) {
      return "Email is required.";
    } else if (value.isNotEmpty && !regExp.hasMatch(value)) {
      return "Invalid email address.";
    } else {
      return null;
    }
  }

  static String? validatePassword(String value, {String name = "Password is required."}) {
    if (value.trim().isEmpty) {
      return name;
    } else {
      return null;
    }
  }

  // validation for name
  String? validateName(String value, {String text = "Name is required"}) {
    if (value.trim().isEmpty) {
      return text;
    }
    return null;
  }
}
