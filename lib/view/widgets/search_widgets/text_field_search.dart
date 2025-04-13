import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/cubit/searching_cubit.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<SearchingCubit>().controllerSearching,
      onChanged: (value) {
        context.read<SearchingCubit>().getSearchingShoes(value);
      },
      style: TextStyle(color: AColors.black, fontSize: 18),
      cursorColor: AColors.black,
      decoration: InputDecoration(
        filled: true, fillColor: AColors.white,
        // suffixIconConstraints: BoxConstraints(),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.search,
              color: AColors.grey,
            ),
          ),
        ),

        //--
        hintText: "Search..",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),

        //--

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),

        //--

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AColors.green,
            width: 2,
          ),
        ),
      ),
    );
  }
}
