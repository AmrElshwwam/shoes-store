import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/profile_data_cubit.dart';
import 'package:shoes_store/view/widgets/profile_widgets/custom_appbar_profile.dart';
import 'package:shoes_store/view/widgets/profile_widgets/custom_text_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileDataCubit>(
      create: (context) => ProfileDataCubit(),
      child: Scaffold(
        body: BlocBuilder<ProfileDataCubit, ProfileDataState>(
          builder: (context, state) {
            bool isOpenField =
                (state is OpenFieldState) ? state.openField : false;
            final profileCubit = context.read<ProfileDataCubit>();
            return Column(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    // color: AColors.green,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20),
                          ),
                          gradient: RadialGradient(
                            radius: 3,
                            colors: [
                              AColors.green,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),

                      //--

                      SafeArea(
                        child: CustomAppbarProfile(),
                      ),

                      //--

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Stack(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 218, 218, 218),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: AColors.green,
                                  size: 50,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    backgroundColor: AColors.green,
                                    child: Icon(
                                      Icons.edit,
                                      color: AColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //--

                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          //-- Appbar

                          //--  Body

                          CustomTitleTextFieldProfile(
                            controller: profileCubit.fullNameController,
                            // readOnly: !isOpenField,
                            titleField: "full_name".tr(context),
                            hintField: "Your Full Name",
                            // color: isOpenField
                            //     ? AColors.green
                            //     : AColors.grey.withValues(alpha: .3),
                          ),

                          //--

                          CustomTitleTextFieldProfile(
                            controller: profileCubit.emailController,
                            // readOnly: !isOpenField,
                            titleField: "email".tr(context),
                            hintField: "Your Email",
                            // color: isOpenField
                            //     ? AColors.green
                            //     : AColors.grey.withValues(alpha: .3),
                          ),

                          //--

                          CustomTitleTextFieldProfile(
                            controller: profileCubit.phoneController,
                            // readOnly: !isOpenField,
                            titleField: "phone".tr(context),
                            hintField: "Your Phone",
                            // color: isOpenField
                            //     ? AColors.green
                            //     : AColors.grey.withValues(alpha: .3),
                          ),

                          //--

                          CustomTitleTextFieldProfile(
                            controller: profileCubit.passwordController,
                            // readOnly: !isOpenField,
                            titleField: "password".tr(context),
                            hintField: "Your Password",
                            // color: isOpenField
                            //     ? AColors.green
                            //     : AColors.grey.withValues(alpha: .3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // زر الشراء في الأسفل
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {
                      final profileCubit = context.read<ProfileDataCubit>();
                      profileCubit.updateProfileData(
                        profileCubit.fullNameController.text,
                        profileCubit.emailController.text,
                        profileCubit.phoneController.text,
                        profileCubit.passwordController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AColors.green,
                          duration: Duration(seconds: 1),
                          content: Text(
                            "profile_data_saved".tr(context),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                    color: AColors.green,
                    height: 60,
                    minWidth: double.infinity,
                    child: Text(
                      "update_profile".tr(context),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
