import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hena_gym/business-logic/auth/login_cubit.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:hena_gym/data/repository/auth_repo.dart';
import 'package:hena_gym/data/services/auth_services.dart';
import 'package:hena_gym/frontend/screens/authenticate/forget_password.dart';
import 'package:hena_gym/frontend/screens/authenticate/register.dart';
import 'package:hena_gym/frontend/screens/authenticate/validator.dart';
import 'package:hena_gym/utils/components.dart';

class SignIn extends StatelessWidget {
   SignIn({Key? key}) : super(key: key);
   final emailController = TextEditingController();
   final passwordController = TextEditingController();
   final formKey = GlobalKey<FormState>();
  AuthRepository authRepository = new AuthRepository(new AuthServices());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>LoginCubit(authRepository: authRepository),
      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context,state){
          if(state is LoginErrorState){
            showToast(text: 'wrong email or password', state: ToastStates.ERROR);
          }
          if(state is LoginSuccessState){
            showToast(text: 'successful login ', state: ToastStates.SUCCESS);
            // TODO add screen of home.
            //navigateAndFinish(context, //home());
          }
        },
        builder: (context ,state){
          var cubit= LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/header.png",
                    height: 70,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 150,
                    height: 80,
                    child: new Image.asset('assets/images/logo.png',
                    fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(

                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 35,
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                  controller: emailController,
                                  decoration: textInputDecoration.copyWith(
                                      labelText: 'Email',
                                      suffixIcon: const Icon(Icons.email)),
                                  validator: Validator.validateEmail
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: textInputDecoration.copyWith(
                                      labelText: 'Password',
                                      suffixIcon: const Icon(Icons.lock_outlined)),
                                  validator: Validator.validatePassword
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 40.0,
                                width: 140.0,
                                child: TextButton(
                                  child: const Text('Sign in'),
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: MyColors.darkBlue,
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.signIn(email: emailController.text, password: passwordController.text);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'don\'t have an account ?',
                                    style: TextStyle(color: MyColors.darkBlue),
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Sign up',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    ),
                                    style: TextButton.styleFrom(
                                      primary: MyColors.darkRed,
                                    ),
                                    onPressed: () {
                                      navigateTo(context, RegisterScreen());
                                    },
                                  )
                                ],
                              ),


                              TextButton(
                                child: const Text(
                                  'forget password ?',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                                style: TextButton.styleFrom(
                                  primary: MyColors.darkRed,
                                ),
                                onPressed: () {
                                  navigateTo(context, ForgetPasswordScreen());
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
