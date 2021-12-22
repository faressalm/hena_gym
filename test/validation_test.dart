import 'dart:io';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:hena_gym/frontend/screens/authenticate/validator.dart';


  void main(){
    test('empty email', (){
      var result = Validator.validateEmail('');
      expect(result, Validator.emptyEmail);
    });
    test('wrong email format',(){
      var result = Validator.validateEmail('ahmed.gmail.com');
      expect(result, Validator.wrongEmailFormat);
    });
    test('wrong email format', (){
      var result = Validator.validateEmail('ahmed@gmail');
      expect(result, Validator.wrongEmailFormat);
    });
    test('empty password', (){
      var result = Validator.validatePassword('');
      expect(result, Validator.emptyPassword);
    });
    test('short password', (){
      var result = Validator.validatePassword('afda');
      expect(result, Validator.shortPassword);
    });
    test('empty phone number', (){
      var result = Validator.validatePhone('');
      expect(result, Validator.emptyPhoneNumber);
    });
    test('alphabetic in phone number', (){
      var result = Validator.validatePhone('1413afafajf23');
      expect(result, Validator.wrongPhoneNumberFormat);
    });
    test('short phone number', (){
      var result = Validator.validatePhone('1432');
      expect(result, Validator.shortPhoneNumber);
    });
    test('empty username', (){
      var result = Validator.validateUsername('');
      expect(result, Validator.emptyUserName);
    });
    test('short username', (){
      var result = Validator.validateUsername('saf');
      expect(result,Validator.shortUserName);
    });
  }
