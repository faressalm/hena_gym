import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/business-logic/auth/forget_password_cubit.dart';
import 'package:hena_gym/business-logic/auth/forget_password_state.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:hena_gym/data/repository/auth_repo.dart';
import 'package:hena_gym/data/services/auth_services.dart';
import 'package:hena_gym/frontend/screens/authenticate/sign_in.dart';
import 'package:hena_gym/frontend/screens/authenticate/validator.dart';
import 'package:hena_gym/utils/components.dart';

class ForgetPasswordScreen extends StatelessWidget{
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AuthRepository authRepository = new AuthRepository(new AuthServices());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>ForgetCubit(authRepository: authRepository),
    child: BlocConsumer<ForgetCubit,ForgetPasswordState>(
      listener: (context,state){
        if(state is ForgetSuccessState){
          showToast(text: 'check your email', state: ToastStates.SUCCESS);
          navigateAndFinish(context, SignIn());
        }
        if(state is ForgetErrorState){
          showToast(text: 'try again error occurred', state: ToastStates.ERROR);
        }
      },
      builder: (context ,state){
        var cubit= ForgetCubit.get(context);
        return  Scaffold(
            body: Container(
              height: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/header.png",
                    height: 70,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 30,
                  )
                  ,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 280,
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextFormField(
                                controller: emailController,
                                decoration: textInputDecoration.copyWith(
                                    labelText: 'The email you registered with',
                                    suffixIcon: const Icon(Icons.email)),
                                validator: Validator.validateEmail
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 40.0,
                              width: 140.0,
                              child: TextButton(
                                child: const Text('send request'),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: MyColors.darkBlue,
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                      cubit.sendResetEmail(email: emailController.text, );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        );
      },
    ));
  }

}