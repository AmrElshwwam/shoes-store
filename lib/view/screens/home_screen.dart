import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/cubit/hide_bottom_appbar_cubit.dart';
import 'package:shoes_store/data/shoes_data.dart';
import 'package:shoes_store/view/widgets/home_widgets/custom_appbar_home.dart';
import 'package:shoes_store/view/widgets/home_widgets/custom_box_new_collection.dart';
import 'package:shoes_store/view/widgets/home_widgets/custom_scroll_brands.dart';
import 'package:shoes_store/view/widgets/home_widgets/custom_text_stores.dart';
import 'package:shoes_store/view/widgets/wrap_list_products.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: BlocBuilder<HideBottomAppbarCubit, HideBottomAppbarState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller:
                context.read<HideBottomAppbarCubit>().scrollController,
            child: Column(
              children: [
                //--- AppBar
                CustomAppbarHome(),

                //--- Container New Collection
                CustomBoxNewCollection(),

                //--- Text Stores & See all
                CustomTextStores(),

                //--- List Scroll Stores
                CustomScrollBrands(),

                //-- List Products
                WrapListProducts(
                  dataShoes: dataShoes,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
