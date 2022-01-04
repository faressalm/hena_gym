import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hena_gym/data/services/url_services.dart';
import 'package:hena_gym/frontend/screens/authenticate/validator.dart';

void main() {
  test('empty email', () {
    var result = Validator.validateEmail('');
    expect(result, Validator.emptyEmail);
  });
  test('wrong email format', () {
    var result = Validator.validateEmail('ahmed.gmail.com');
    expect(result, Validator.wrongEmailFormat);
  });
  test('wrong email format', () {
    var result = Validator.validateEmail('ahmed@gmail');
    expect(result, Validator.wrongEmailFormat);
  });
  test('empty password', () {
    var result = Validator.validatePassword('');
    expect(result, Validator.emptyPassword);
  });
  test('short password', () {
    var result = Validator.validatePassword('afda');
    expect(result, Validator.shortPassword);
  });
  test('very long password', () {
    var result = Validator.validatePassword(
        'adfgssssssdfadsgdfdsafADADFDAssssssssssssfaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaddddddddddddddddddddddddddddddddddddddd');
    expect(result, Validator.longPassword);
  });
  test('empty phone number', () {
    var result = Validator.validatePhone('');
    expect(result, Validator.emptyPhoneNumber);
  });
  test('alphabetic in phone number', () {
    var result = Validator.validatePhone('1413afafajf23');
    expect(result, Validator.wrongPhoneNumberFormat);
  });
  test('short phone number', () {
    var result = Validator.validatePhone('1432');
    expect(result, Validator.shortPhoneNumber);
  });
  test('long phone number', () {
    var result = Validator.validatePhone(
        '31243245421413542514354215432542123521235421354215435421541254');
    expect(result, Validator.longPhoneNumber);
  });
  test('empty username', () {
    var result = Validator.validateUsername('');
    expect(result, Validator.emptyUserName);
  });
  test('short username', () {
    var result = Validator.validateUsername('saf');
    expect(result, Validator.shortUserName);
  });
  test('right format for email', () {
    var result = Validator.validateEmail('ahmedyasser882000@gmail.com');
    expect(result, null);
  });
  test('right phone number', () {
    var result = Validator.validatePhone('01000815023');
    expect(result, null);
  });
  test('right password', () {
    var result = Validator.validatePassword('afafgsfdfafa');
    expect(result, null);
  });
  test('empty birthdate', () {
    var result = Validator.validateBirthdate('');
    expect(result, Validator.emptyBirthDate);
  });
  test('wrong format for birthdate', () {
    var result = Validator.validateBirthdate('adfs');
    expect(result, Validator.wrongBirthDateFormat);
  });
}
