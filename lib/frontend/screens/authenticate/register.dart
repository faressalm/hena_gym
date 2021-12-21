import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../constants/my_gui.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegisterScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              height: 20,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        color: MyColors.darkBlue),
                    children: [
                      TextSpan(text: "Create\n"),
                      TextSpan(text: "Account"),
                    ])),
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
                        TextFormField(
                          controller: nameController,
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Username',
                              suffixIcon: const Icon(Icons.person)),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'password confirmation cannot be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Email',
                              suffixIcon: const Icon(Icons.email)),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Email cannot be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Password',
                              suffixIcon: const Icon(Icons.lock_outlined)),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'password cannot be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Phone',
                              suffixIcon: const Icon(Icons.phone)),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Phone cannot be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: dateController,
                          enabled: true,
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.parse('1990-10-03'),
                                    lastDate: DateTime.now())
                                .then((value) => dateController.text =
                                    DateFormat.yMMMd().format(value!));
                          },
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Birthday',
                              suffixIcon: const Icon(Icons.calendar_today)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ToggleSwitch(
                          totalSwitches: 2,
                          minWidth: 90,
                          initialLabelIndex: 0,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          labels: const ['Male', 'Female'],
                          icons: const [Icons.male, Icons.female],
                          activeBgColors: const [
                            [MyColors.darkBlue],
                            [MyColors.darkRed]
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 40.0,
                          width: 140.0,
                          child: TextButton(
                            child: const Text('Register'),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: MyColors.darkBlue,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                //cubit.userRegister(email: emailController.text, phone: phoneController.text, password: passwordController.text);
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
                              'Have an account?',
                              style: TextStyle(color: MyColors.darkBlue),
                            ),
                            TextButton(
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                              style: TextButton.styleFrom(
                                primary: MyColors.darkRed,
                              ),
                              onPressed: () {
                                // navigateTo(context, LoginScreen());
                              },
                            )
                          ],
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
  }
}
