import 'package:equatable/equatable.dart';
import 'package:furniture_store/featuers/main/domain/entities/review.dart';

class Product extends Equatable {
  final String productId;
  final String productName;
  final List<Review> productReviews;

  final double productRate;

  final int productPrice;
  final String productCategory;
  final String productDescription;
  final List<String> productImages;

  const Product(

  {
   required this.productId,
   required this.productName,
   required this.productReviews,
   required this.productRate,
   required this.productPrice,
   required this.productCategory,
   required this.productDescription,
   required this.productImages,
}





  );

  @override
  // TODO: implement props
  List<Object?> get props => [
        productId,
        productName,
        productReviews,
        productRate,
        productPrice,
        productDescription,
        productImages,
      ];
}
