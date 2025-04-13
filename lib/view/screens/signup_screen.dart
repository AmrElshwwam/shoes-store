import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/cubit/form_validate_field_cubit.dart';
import 'package:shoes_store/cubit/visibility_password_cubit.dart';
import 'package:shoes_store/view/screens/signin_screen.dart';
import 'package:shoes_store/view/widgets/background_gradient.dart';
import 'package:shoes_store/view/widgets/custom_button.dart';
import 'package:shoes_store/view/widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
      child: Scaffold(
        body: Stack(
          children: [
            //-- BackGround
            BackgroundGradient2(),

            Column(
              children: [
                Expanded(
                  child: Container(
                    width: sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        "Create \nYour Account",
                        textAlign: TextAlign.center,
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
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
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
                      child: Center(
                        child: SingleChildScrollView(
                          child: Form(
                            child: BlocBuilder<FormValidationCubit,
                                Map<String, String?>>(
                              builder: (context, validationState) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomTitleTextField(
                                      controller: context
                                          .read<FormValidationCubit>()
                                          .fullNameController,
                                      titleField: "Full Name",
                                      hintField: "Enter Your Full Name",
                                      onChanged: (value) {
                                        context
                                            .read<FormValidationCubit>()
                                            .validateField("Full Name", value);
                                      },
                                      errorText: validationState["Full Name"],
                                    ),
                                    CustomTitleTextField(
                                      controller: context
                                          .read<FormValidationCubit>()
                                          .phoneController,
                                      titleField: "Phone",
                                      hintField: "Enter Your Phone",
                                      onChanged: (value) {
                                        context
                                            .read<FormValidationCubit>()
                                            .validateField("Phone", value);
                                      },
                                      errorText: validationState["Phone"],
                                    ),
                                    CustomTitleTextField(
                                      controller: context
                                          .read<FormValidationCubit>()
                                          .emailController,
                                      titleField: "Email",
                                      hintField: "Enter Your Email",
                                      onChanged: (value) {
                                        context
                                            .read<FormValidationCubit>()
                                            .validateField("Email", value);
                                      },
                                      errorText: validationState["Email"],
                                    ),
                                    BlocBuilder<VisibilityPasswordCubit,
                                        VisibilityPasswordState>(
                                      builder: (context, state) {
                                        bool isObscure = state
                                                is UpdatedVisibilityPasswordState
                                            ? !state.visibilityOn
                                            : true;
                                        return CustomTitleTextField(
                                          controller: context
                                              .read<FormValidationCubit>()
                                              .passwordController,
                                          titleField: "Password",
                                          hintField: "Enter Your Password",
                                          obscureText: isObscure,
                                          suffixIcon: isObscure
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          onTapIconSuffix: () {
                                            context
                                                .read<VisibilityPasswordCubit>()
                                                .toggleVisibility();
                                          },
                                          onChanged: (value) {
                                            context
                                                .read<FormValidationCubit>()
                                                .validateField(
                                                    "Password", value);
                                          },
                                          errorText:
                                              validationState["Password"],
                                        );
                                      },
                                    ),

                                    //--
                                    SizedBox(height: 50),

                                    //-- CustomButtonSignUp
                                    CustomButton(
                                      sw: sw,
                                      textButton: "SIGN UP",
                                      onTap: () {
                                        final formCubit =
                                            context.read<FormValidationCubit>();

                                        bool isValid =
                                            formCubit.validateAllFields();

                                        if (isValid) {
                                          formCubit.saveData();

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "Account Created Successfully",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              duration: Duration(seconds: 1),
                                              backgroundColor: AColors.green,
                                            ),
                                          );

                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SigninScreen(),
                                            ),
                                          );
                                        }
                                      },
                                    ),

                                    //--
                                    SizedBox(height: 10),

                                    //--

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "You have account? ",
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
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        const SigninScreen(),
                                              ),
                                            );
                                          },
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "Sign In",
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
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
