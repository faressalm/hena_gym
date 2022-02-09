import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business-logic/auth/register_cubit.dart';
import '../../../business-logic/settings/settings_cubit.dart';
import '../../../business-logic/settings/settings_states.dart';
import '../../../constants/my_gui.dart';
import '../authenticate/validator.dart';

class SettingsScreen extends StatelessWidget {
  TextEditingController phone = TextEditingController();
  TextEditingController username = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsCubit()..getUserData(context),
      child: BlocConsumer<SettingsCubit, SettingStates>(
        listener: (context, state) {
          var cubit = SettingsCubit.get(context);
          if (state is GetUserDataSuccessfully) {
            phone.text = cubit.phone;
            username.text = cubit.username;
          }
        },
        builder: (context, state) {
          var cubit = SettingsCubit.get(context);
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Settings",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.darkRed,
                                    fontSize: 30),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                child: Center(
                                  child: Icon(Icons.person_outline),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: username,
                                decoration: textInputDecoration.copyWith(
                                    labelText: 'Username',
                                    suffixIcon: const Icon(Icons.person)),
                                validator: Validator.validateUsername,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: phone,
                                decoration: textInputDecoration.copyWith(
                                    labelText: 'phone',
                                    suffixIcon: const Icon(Icons.phone)),
                                validator: Validator.validatePhone,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.updateUserData(
                                          context, phone.text, username.text);
                                    }
                                  },
                                  child: Text("update data")),
                              ElevatedButton(
                                  onPressed: () {
                                    cubit.signOut();
                                  },
                                  child: Text("logout")),
                            ],
                          ),
                        ),
                      )),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
