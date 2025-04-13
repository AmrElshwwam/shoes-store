import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/profile_data_cubit.dart';

class CustomTitleTextFieldProfile extends StatelessWidget {
  const CustomTitleTextFieldProfile({
    super.key,
    required this.titleField,
    required this.hintField,
    required this.controller,
    required this.readOnly,
    required this.color,
  });

  final String titleField;
  final String hintField;
  final TextEditingController controller;
  final bool readOnly;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDataCubit, ProfileDataState>(
      builder: (context, state) {
        final profileCubit = context.read<ProfileDataCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleField,
              style: TextStyle(
                fontSize: 20,
                color: AColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),

            //--

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                controller: controller,
                readOnly: readOnly,
                style: TextStyle(color: AColors.black, fontSize: 18),
                cursorColor: AColors.black,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        profileCubit.openedField();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "edit".tr(context),
                          style: TextStyle(
                            color: AColors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //--
                  hintText: hintField,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),

                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: BorderSide(
                  //     color: AColors.grey,
                  //     width: 2,
                  //   ),
                  // ),

                  //--

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AColors.grey.withValues(alpha: .3),
                      // width: 1,
                    ),
                  ),

                  //--

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: color,
                      // width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
