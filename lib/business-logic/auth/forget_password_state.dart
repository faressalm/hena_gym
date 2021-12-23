
import 'package:flutter/material.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgetLoadingState extends ForgetPasswordState{}
class ForgetSuccessState extends ForgetPasswordState{}
class ForgetErrorState extends ForgetPasswordState{}