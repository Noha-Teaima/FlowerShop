// import 'package:task/login/cubit/login_cubit.dart';
// import 'package:task/login/loginScreen.dart';
// import 'package:task/signUp/cubit/sign_up_cubit.dart';
// import 'package:task/signUp/widgets/custom_text_field.dart';
// import 'package:task/language_cubit/language_cubit.dart';
import 'package:ecommerce/signUp/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../login/LoginScreen.dart';
import 'cubit/sign_up_cubit.dart';

//import '../login/widgets/custom_text_field.dart';

class SignUpScreenProject extends StatefulWidget {
  const SignUpScreenProject({super.key});

  @override
  State<SignUpScreenProject> createState() => _SignUpScreenProjectState();
}

class _SignUpScreenProjectState extends State<SignUpScreenProject> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
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
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //       onPressed: (){
      //         context.read<LanguageCubit>().changeLanguage();
      //       },
      //       icon: Icon(Icons.language,color: Colors.green,)),
      // ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      AppLocalizations.of(context)!.sign_up,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    CustomTextField(
                      height: height,
                      hintText: AppLocalizations.of(context)!.name,
                      controller: _nameController,
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    CustomTextField(
                        height: height,
                        hintText: AppLocalizations.of(context)!.email,
                        controller: _emailController),
                    SizedBox(
                      height: height * .03,
                    ),
                    CustomTextField(
                      height: height,
                      hintText: AppLocalizations.of(context)!.phone,
                      controller: _phoneController,
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    CustomTextField(
                      height: height,
                      hintText: AppLocalizations.of(context)!.password,
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    BlocBuilder<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                        if (state is SignUpLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return InkWell(
                          onTap: () {
                            context.read<SignUpCubit>().signUp(
                                email: _emailController.text,
                                password: _passwordController.text,
                                name: _nameController.text,
                                phone: _phoneController.text);
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
                                AppLocalizations.of(context)!.sign_up_button,
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
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.account,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAll(LoginScreen());
                          },
                          child: Text(
                            AppLocalizations.of(context)!.sign_in,
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
          // _buildPositionedButton(
          //   width: width,
          //   textColor: Colors.blue[800]!,
          //   radiusColor: Colors.blue[800]!,
          //   buttonText: "Sign In With Facebook",
          //   bottomPosition: height * 0.10, ),
          // _buildPositionedButton(
          //   width: width,
          //   textColor: Colors.green,
          //   radiusColor: Colors.green,
          //   buttonText: "Sign In With Google",
          //   bottomPosition: height * 0.01, ),
        ],
      ),
    );
  }

  // Positioned _buildPositionedButton({
  //   // required double height,
  //   required double width,
  //   required Color textColor,
  //   required Color radiusColor,
  //   required String buttonText,
  //   required double bottomPosition,}) {
  //   return Positioned(
  //     bottom: bottomPosition,
  //     // bottom: height * 0.06,
  //     left: width * 0.05,
  //     right: width * 0.05,
  //     child: Container(
  //       width: width * 0.8,
  //       height: 60,
  //       decoration: BoxDecoration(
  //         border: Border.all(color: radiusColor),
  //         borderRadius: BorderRadius.circular(50),
  //       ),
  //       child: Center(
  //         child: Text(
  //           buttonText,
  //           style: TextStyle(
  //             color: textColor,
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
