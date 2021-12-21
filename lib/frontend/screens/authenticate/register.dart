import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hena_gym/constants/my_gui.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child:new Image.asset("assets/images/header.png",
                height: 70,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "    Create \n      Account",
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                color: MyColors.darkBlue
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(

                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                            height:35,
                        ),
                        TextFormField(
                          controller: nameController,
                          decoration:InputDecoration(

                              labelText: 'Username',
                              suffixIcon: Icon(
                                  Icons.person
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0) ,
                              borderSide: BorderSide(color: MyColors.darkRed, width: 2.0),
                            ),

                          ),
                          validator: (String?value){
                            if(value!.isEmpty){
                              return 'password confirmation cannot be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              suffixIcon: Icon(
                                  Icons.email
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0) ,
                              borderSide: BorderSide(color: MyColors.darkRed, width: 2.0),
                            ),

                          ),
                          validator: (String? value){
                            if(value!.isEmpty){
                              return 'Email cannot be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration:InputDecoration(
                              labelText: 'Password',
                              suffixIcon: Icon(
                                  Icons.lock_outlined
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0) ,
                              borderSide: BorderSide(color: MyColors.darkRed, width: 2.0),
                            ),
                          ),
                          validator: (String?value){
                            if(value!.isEmpty){
                              return 'password cannot be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: 'Phone',
                              suffixIcon: Icon(
                                  Icons.phone
                              ),
                              border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0) ,
                              borderSide: BorderSide(color: MyColors.darkRed, width: 2.0),
                            ),
                          ),
                          validator: (String?value){
                            if(value!.isEmpty){
                              return 'Phone cannot be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: dateController,
                          enabled: true,
                          keyboardType: TextInputType.datetime,
                          onTap: (){
                            showDatePicker(context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.parse('1990-10-03'),
                                lastDate: DateTime.now()
                            ).then((value) => dateController.text =
                                DateFormat.yMMMd().format(value!));

                          },
                          decoration:InputDecoration(
                              labelText: 'your birthday',
                              suffixIcon: Icon(
                                  Icons.calendar_today
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0) ,
                              borderSide: BorderSide(color: MyColors.darkRed, width: 2.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ToggleSwitch(totalSwitches: 2,
                          minWidth: 90,
                          initialLabelIndex: 0,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          labels: ['Male', 'Female'],
                          icons: [Icons.male, Icons.female],
                          activeBgColors: [[MyColors.darkBlue],[MyColors.darkRed]],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                    Container(
                      height: 40.0,
                      width: 140.0,
                      child: TextButton(
                        child: Text(
                            'Register'
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: MyColors.darkBlue,

                        ),
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            //cubit.userRegister(email: emailController.text, phone: phoneController.text, password: passwordController.text);
                          }
                        },
                      ),
                    ),
                     SizedBox(
                       height: 20,
                     ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Have an account?',
                              style: TextStyle(
                                color: MyColors.darkBlue
                              ),
                            ),
                            TextButton(
                              child:Text(
                                  'Login',
                                style: TextStyle(
                                  decoration: TextDecoration.underline
                                ),
                              ) ,
                              style: TextButton.styleFrom(
                                primary: MyColors.darkRed,
                              ),
                              onPressed: (){
                               // navigateTo(context, LoginScreen());
                              },
                            )
                          ],
                        ),
                        SizedBox(
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