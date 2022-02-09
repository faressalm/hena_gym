class Validator {
  static String emptyEmail = 'email can\'t be empty';
  static String wrongEmailFormat = 'wrongEmailFormat';
  static String emptyPassword = 'password can\'t be empty';
  static String shortPassword = 'password should be longer than 7 characters';
  static String emptyUserName = 'username can\'t be empty';
  static String shortUserName = 'username should be longer than 7 characters';
  static String emptyPhoneNumber = 'phone number can\'t be empty';
  static String wrongPhoneNumberFormat = 'phone number must be numeric';
  static String shortPhoneNumber = 'phone number must be longer than that';
  static String emptyBirthDate = 'birth date can\'t be empty';
  static String wrongBirthDateFormat = 'check birth date';
  static String longPhoneNumber = 'very long phone number';
  static String longPassword = 'very long password';
  static String? validateEmail(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyEmail;
      }
      if (!isValidEmail(value)) {
        return wrongEmailFormat;
      }
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyPhoneNumber;
      }
      if (!_isNumeric(value)) {
        return wrongPhoneNumberFormat;
      }
      if (value.length < 11) {
        return shortPhoneNumber;
      }

      if (value.length > 25) {
        return longPhoneNumber;
      }
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyUserName;
      }
      if (value.length < 7) {
        return shortUserName;
      }
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyPassword;
      }
      if (value.length < 7) {
        return shortPassword;
      }
      if (value.length > 35) {
        return longPassword;
      }
    }
    return null;
  }

  static String? validateBirthdate(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyBirthDate;
      }
      if (value.length != 11 && value.length != 12) {
        return wrongBirthDateFormat;
      }
    }
    return null;
  }

  static bool isValidEmail(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  static bool isValidPhoneNumber(String value) {
    String pattern = r'^(?:[+0][1-9])?[0-9]{5,16}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty || !regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool _isNumeric(String str) {
    if (str.isEmpty) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  /*Calculate calories */
  static String? weightValidator(String? weight) {
    if (weight!.isEmpty) {
      return "Set your weight";
    } else if (weight.length > 3 && _isNumeric(weight) ||
        weight.length > 6 ||
        double.parse(weight) > 250 ||
        double.parse(weight) < 30) {
      return "Enter valid weight";
    } else {
      return null;
    }
  }

  static String? heightValidator(String? height) {
    if (height!.isEmpty) {
      return "Set your height";
    } else if (height.length > 3 && _isNumeric(height) ||
        height.length > 6 ||
        double.parse(height) > 250 ||
        double.parse(height) < 30) {
      return "Enter valid height";
    } else {
      return null;
    }
  }

  static String? agetValidator(String? age) {
    if (age!.isEmpty) {
      return "Set your age";
    } else if (age.length > 2 || !_isNumeric(age)) {
      return "Enter valid age";
    } else {
      return null;
    }
  }
}
