import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/cubit/form_validate_field_cubit.dart';
import 'package:shoes_store/cubit/visibility_password_cubit.dart';
import 'package:shoes_store/view/screens/master_screen.dart';
import 'package:shoes_store/view/screens/signup_screen.dart';
import 'package:shoes_store/view/widgets/background_gradient.dart';
import 'package:shoes_store/view/widgets/custom_button.dart';
import 'package:shoes_store/view/widgets/custom_text_field.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.sizeOf(context).width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VisibilityPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => FormValidationCubit(),
        ),
      ],
      child: BlocBuilder<FormValidationCubit, Map<String, String?>>(
        builder: (context, state) {
          final formCubit = context.read<FormValidationCubit>();
          return Scaffold(
            body: Stack(
              children: [
                //-- BackGround
                BackgroundGradient2(),

                //--

                Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: sw,
                        decoration: BoxDecoration(
                          // color: AColors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            "Hello \nWelcome Back..",
                            style: TextStyle(
                              color: AColors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //--

                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AColors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              offset: Offset(0, -5),
                              spreadRadius: 3,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //---- Field Email

                              CustomTitleTextField(
                                controller: formCubit.emailSignInController,
                                titleField: "Email",
                                hintField: "Enter Your Email",
                              ),

                              //---- Field Password

                              BlocBuilder<VisibilityPasswordCubit,
                                  VisibilityPasswordState>(
                                builder: (context, state) {
                                  bool isObscure =
                                      state is UpdatedVisibilityPasswordState
                                          ? !state.visibilityOn
                                          : true;
                                  return CustomTitleTextField(
                                    controller:
                                        formCubit.passwordSignInController,
                                    titleField: "Password",
                                    hintField: "Enter Your Password",
                                    suffixIcon: isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    onTapIconSuffix: () {
                                      context
                                          .read<VisibilityPasswordCubit>()
                                          .toggleVisibility();
                                    },
                                    obscureText: isObscure,
                                  );
                                },
                              ),

                              //--

                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: InkWell(
                                  onTap: () {},
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Forget Password?",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //--

                              SizedBox(height: 50),

                              //-- Button Sign In

                              CustomButton(
                                sw: sw,
                                textButton: "SIGN IN",
                                onTap: () async {
                                  final messenger =
                                      ScaffoldMessenger.of(context);
                                  final navigator = Navigator.of(context);

                                  String resultSignIn = await formCubit
                                      .signIn(); // استدعاء دالة تسجيل الدخول

                                  if (resultSignIn.isNotEmpty) {
                                    messenger.showSnackBar(
                                      SnackBar(
                                        backgroundColor: AColors.green,
                                        duration: Duration(seconds: 1),
                                        content: Text(
                                          resultSignIn,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ); // عرض رسالة الخطأ
                                  } else {
                                    navigator.pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => MasterScreen(),
                                      ),
                                    );
                                  }
                                },
                              ),

                              //--

                              SizedBox(height: 10),

                              //--
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Don't have account? ",
                                      style: TextStyle(
                                        color: AColors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),

                                  //--

                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const SignupScreen(),
                                        ),
                                      );
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
