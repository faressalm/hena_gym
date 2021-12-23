import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business-logic/auth/forget_password_cubit.dart';
import '../../../business-logic/auth/forget_password_state.dart';
import '../../../constants/my_gui.dart';
import '../../../data/repository/auth_repo.dart';
import '../../../data/services/auth_services.dart';
import 'sign_in.dart';
import 'validator.dart';
import '../../../utils/components.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AuthRepository authRepository = AuthRepository(AuthServices());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            ForgetCubit(authRepository: authRepository),
        child: BlocConsumer<ForgetCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetSuccessState) {
              showToast(text: 'check your email', state: ToastStates.SUCCESS);
              navigateAndFinish(context, SignIn());
            }
            if (state is ForgetErrorState) {
              showToast(
                  text: 'try again error occurred', state: ToastStates.ERROR);
            }
          },
          builder: (context, state) {
            var cubit = ForgetCubit.get(context);
            return Scaffold(
                resizeToAvoidBottomInset: false,
                body: Column(
                  children: [
                    Image.asset(
                      "assets/images/header.png",
                      height: 70,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 80,
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextFormField(
                                      controller: emailController,
                                      decoration: textInputDecoration.copyWith(
                                          labelText:
                                              'The email you registered with',
                                          suffixIcon: const Icon(Icons.email)),
                                      validator: Validator.validateEmail),
                                  const SizedBox(
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
                                          cubit.sendResetEmail(
                                            email: emailController.text,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ));
          },
        ));
  }
}
