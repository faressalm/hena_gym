import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/business-logic/settings/settings_states.dart';
import 'package:hena_gym/data/services/settings_service.dart';
import 'package:hena_gym/utils/components.dart';
import 'package:hena_gym/utils/constants.dart';

class SettingsCubit extends Cubit<SettingStates>{
  SettingsCubit() : super(SettingInitialState());
  SettingsService settingsService = SettingsService();
  static SettingsCubit get(context) => BlocProvider.of(context);
   String username="";
   String phone="";
  void getUserData(context){
    settingsService.getUserData(context).then((value)  {
      username=userData!.userName;
      phone=userData!.phoneNumber;
      emit(GetUserDataSuccessfully());
    }).catchError((error){
      print(error.toString());
      print("error at getting user");
      emit(GetUserDataFailed());
    } );
  }
  void updateUserData(context,String phone , String username){
    settingsService.updateUserData(phone, username, context).then((value) {
      if(value){
        showToast(text: "data updated successfully", state: ToastStates.SUCCESS);
        emit(UpdateUserDataSuccessfully());
        getUserData(context);
      }else{
        showToast(text: "data failed to update", state: ToastStates.ERROR);
        emit(UpdateUserDataFailed());
      }
    });
  }
}