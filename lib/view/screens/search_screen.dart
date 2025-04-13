import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/language/app_localizations.dart';
import 'package:shoes_store/cubit/hide_bottom_appbar_cubit.dart';
import 'package:shoes_store/cubit/searching_cubit.dart';
import 'package:shoes_store/view/widgets/search_widgets/custom_stack_search.dart';
import 'package:shoes_store/view/widgets/search_widgets/wrap_list_product_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchingCubit(),
      child: Column(
        children: [
          //--

          CustomStackSearch(),

          //--

          Expanded(
            child: BlocBuilder<SearchingCubit, SearchingState>(
              builder: (context, state) {
                if (state is SearchingNowState) {
                  var data = state.lstShoes;
                  return SingleChildScrollView(
                    controller:
                        context.read<HideBottomAppbarCubit>().scrollController,
                    child: WrapListProductSearch(data: data),
                  );
                } else if (state is SearchingInitial) {
                  return Center(
                    child: Text(
                      "don't have searching".tr(context),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
