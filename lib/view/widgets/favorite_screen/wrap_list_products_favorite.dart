import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_store/core/constant/app_colors.dart';
import 'package:shoes_store/cubit/favorite_product_cubit.dart';
import 'package:shoes_store/model/shoes_model.dart';
import 'package:shoes_store/view/screens/favorite_details_screen.dart';

class WrapListProductsFavorite extends StatelessWidget {
  const WrapListProductsFavorite({
    super.key,
    required this.dataShoes,
    // this.indexShoesModel,
  });

  final List<ShoesModel> dataShoes;
  // final int? indexShoesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Wrap(
        spacing: 15, // المسافة الأفقية بين العناصر
        runSpacing: 20, // المسافة الرأسية بين الصفوف
        children: List.generate(
          dataShoes.length,
          (index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FavoriteDetailsScreen(
                      // index: index,

                      shoesName: dataShoes[index].shoesName,
                      shoesPrice: dataShoes[index].shoesPrice,
                      shoesImage: dataShoes[index].shoesImage,
                      indexShoesModel: dataShoes[index].indexShoesModel,
                      shoesSize: dataShoes[index].shoesSize,
                      indexShoesSize: dataShoes[index].indexShoesSize,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: EdgeInsets.all(10),
                    width: (MediaQuery.sizeOf(context).width / 2) -
                        25, // العرض الثابت لكل عنصر
                    height: 250, // الارتفاع الثابت لكل عنصر
                    decoration: BoxDecoration(
                      color: AColors.grey,
                      borderRadius: BorderRadius.circular(35),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: Image.asset(
                                    dataShoes[index].shoesImage[
                                        dataShoes[index].indexShoesModel],
                                    //image,
                                  ),
                                ),
                              ),

                              //--

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: BlocBuilder<FavoriteProductCubit,
                                    FavoriteProductState>(
                                  builder: (context, state) {
                                    bool isFavorite = false;

                                    if (state
                                        case UpdatedFavoriteState(
                                          :final lstFavorite
                                        )) {
                                      isFavorite = lstFavorite.any(
                                        (product) =>
                                            product.shoesName ==
                                            dataShoes[index].shoesName,
                                      );
                                    }
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),

                                            //-

                                            SizedBox(width: 3),

                                            //-

                                            Text(
                                              "4.5",
                                              style: TextStyle(
                                                color: AColors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),

                                        //--

                                        IconButton(
                                          onPressed: () {
                                            if (isFavorite) {
                                              context
                                                  .read<FavoriteProductCubit>()
                                                  .removeFavorite(
                                                    dataShoes[index],
                                                  );
                                            }
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: isFavorite
                                                ? AColors.red
                                                : AColors.white,
                                            // size: 30,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        //--

                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AColors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(35),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataShoes[index].shoesName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                //--

                                Text(
                                  dataShoes[index].shoesPrice.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color:
                                        const Color.fromARGB(255, 255, 17, 0),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
