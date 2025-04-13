class ShoesModel {
  final String shoesName;
  final double shoesPrice;
  final List<String> shoesImage;
  final int indexShoesModel;
  final List<String> shoesSize;
  final int indexShoesSize;

  ShoesModel({
    required this.shoesName,
    required this.shoesPrice,
    required this.shoesImage,
    required this.indexShoesModel,
    required this.shoesSize,
    required this.indexShoesSize,
  });

  ShoesModel copyWith({
    String? shoesName,
    double? shoesPrice,
    List<String>? shoesImage,
    int? indexShoesModel,
    List<String>? shoesSize,
    int? indexShoesSize,
  }) {
    return ShoesModel(
      shoesName: shoesName ?? this.shoesName,
      shoesPrice: shoesPrice ?? this.shoesPrice,
      shoesImage: shoesImage ?? this.shoesImage,
      indexShoesModel: indexShoesModel ?? this.indexShoesModel,
      shoesSize: shoesSize ?? this.shoesSize,
      indexShoesSize: indexShoesSize ?? this.indexShoesSize,
    );
  }
}

// class ColorShoes {
//   final String colorName;
//   final String colorImage;

//   ColorShoes({
//     required this.colorName,
//     required this.colorImage,
//   });
// }

//----- Model Brand Shoes

// class ModelBrandShoes {
//   final int brandId;
//   final String brandName;

//   ModelBrandShoes({
//     required this.brandId,
//     required this.brandName,
//   });
// }
