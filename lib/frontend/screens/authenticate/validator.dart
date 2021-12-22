 class Validator{
  static String emptyEmail='email can\'t be empty';
  static String wrongEmailFormat='wrongEmailFormat';
  static String emptyPassword='password can\'t be empty';
  static String shortPassword='password should be longer than 7 characters';
  static String emptyUserName='username can\'t be empty';
  static String shortUserName ='username should be longer than 7 characters';
  static String emptyPhoneNumber='phone number can\'t be empty';
  static String wrongPhoneNumberFormat='phone number must be numeric';
  static String shortPhoneNumber= 'phone number must be longer than that';
  static String? validateEmail(String?value){
    if(value!=null){
      if(value.isEmpty){
        return emptyEmail;
      }
      if(!isValidEmail(value)){
        return wrongEmailFormat;
      }
    }
    return null;
  }
   static  String? validatePhone(String?value){
    if(value!=null){
      if(value.isEmpty){
        return emptyPhoneNumber;
      }
      if(value.length<11){
        return shortPhoneNumber;
      }
      if(!_isNumeric(value)){
        return wrongPhoneNumberFormat;
      }
    }
    return null;
  }
  static String? validateUsername(String?value){
    if(value!=null){
      if(value.isEmpty){
        return emptyUserName;
      }
      if(value.length<7){
        return shortUserName;
      }
    }
    return null;
  }
  static String? validatePassword(String?value){
    if(value!=null){
      if(value.isEmpty){
        return emptyPassword;
      }
      if(value.length<7){
        return shortPassword;
      }
    }
    return null;
  }
 static bool isValidEmail(String value) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }
  static bool _isNumeric(String str) {
    if(str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}