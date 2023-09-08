// import 'package:task/login/cubit/login_cubit.dart';
// import 'package:task/login/loginScreen.dart';
// import 'package:task/signUp/cubit/sign_up_cubit.dart';
// import 'package:task/signUp/sign_up_project.dart';
// import 'package:task/signUp/widgets/custom_text_field.dart';
// import 'package:task/language_cubit/language_cubit.dart';
import 'package:ecommerce/ecommerce/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:task/splash/MyHomePage.dart';

import '../signUp/sign_up_project.dart';
import '../signUp/widgets/custom_text_field.dart';
import 'cubit/login_cubit.dart';

//import '../login/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 236, 235),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      AppLocalizations.of(context)!.sign_in,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CustomTextField(
                        height: height,
                        hintText: AppLocalizations.of(context)!.email,
                        controller: _emailController),
                    SizedBox(
                      height: 50,
                    ),
                    CustomTextField(
                      height: height,
                      hintText: AppLocalizations.of(context)!.password,
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginCubit>().login(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              // Get.offAll(VerticalSliderDemo());
                            }
                          },
                          child: Container(
                            width: width * .9,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.sign_in_button,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.account1,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAll(SignUpScreenProject());
                          },
                          child: Text(
                            AppLocalizations.of(context)!.sign_up,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: double.infinity,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
