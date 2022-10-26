import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/featuers/auth/presentation/widgets/inkwell_widget.dart';
import 'package:furniture_store/featuers/main/domain/entities/product.dart';
import 'package:furniture_store/featuers/main/domain/entities/review.dart';
import 'package:furniture_store/featuers/main/presentation/manager/main_bloc.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import '../../../../core/consts/colors.dart';
import '../../../../core/widget/back_icon.dart';

class DetailsScreen extends StatelessWidget {
  final product = const Product(
    productId: 'productId',
    productName: 'productName',
      productCategory:"asd",
    productReviews: [
      Review(
          reviewId: 'reviewId',
          reviewerName: 'reviewerName',
          reviewerRate: 5.0,
          reviewerId: 'reviewerId',
          reviewDate: "20/12/2002",
          reviewerImageUrl:
              "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Mask%20Group%202.png?alt=media&token=8d42573b-c304-4138-94c5-9ddb9d3244bd"),
      Review(
          reviewId: 'reviewId',
          reviewerName: 'reviewerName',
          reviewerRate: 5.0,
          reviewerId: 'reviewerId',
          reviewDate: "20/12/2002",
          reviewerImageUrl:
              "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Mask%20Group%202.png?alt=media&token=8d42573b-c304-4138-94c5-9ddb9d3244bd"),
      Review(
          reviewId: 'reviewId',
          reviewerName: 'reviewerName',
          reviewerRate: 5.0,
          reviewerId: 'reviewerId',
          reviewDate: "20/12/2002",
          reviewerImageUrl:
              "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Mask%20Group%202.png?alt=media&token=8d42573b-c304-4138-94c5-9ddb9d3244bd"),
      Review(
          reviewId: 'reviewId',
          reviewerName: 'reviewerName',
          reviewerRate: 5.0,
          reviewerId: 'reviewerId',
          reviewDate: "20/12/2002",
          reviewerImageUrl:
              "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Mask%20Group%202.png?alt=media&token=8d42573b-c304-4138-94c5-9ddb9d3244bd"),
      Review(
          reviewId: 'reviewId',
          reviewerName: 'reviewerName',
          reviewerRate: 5.0,
          reviewerId: 'reviewerId',
          reviewDate: "20/12/2002",
          reviewerImageUrl:
              "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Mask%20Group%202.png?alt=media&token=8d42573b-c304-4138-94c5-9ddb9d3244bd"),
      Review(
          reviewId: 'reviewId',
          reviewerName: 'reviewerName',
          reviewerRate: 5.0,
          reviewerId: 'reviewerId',
          reviewDate: "20/12/2002",
          reviewerImageUrl:
              "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Mask%20Group%202.png?alt=media&token=8d42573b-c304-4138-94c5-9ddb9d3244bd"),
      Review(
          reviewId: 'reviewId',
          reviewerName: 'reviewerName',
          reviewerRate: 5.0,
          reviewerId: 'reviewerId',
          reviewDate: "20/12/2002",
          reviewerImageUrl:
              "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Mask%20Group%202.png?alt=media&token=8d42573b-c304-4138-94c5-9ddb9d3244bd"),
    ],
    productRate: 4.2,
    productPrice: 300,
    productDescription: 'asdasd asdijaofi jefa oijsdpfih aodsifhm jodsaif ',
    productImages: [
      "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Mask%20Group%202.png?alt=media&token=8d42573b-c304-4138-94c5-9ddb9d3244bd",
      "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Masks%20Group%202.png?alt=media&token=0fca109f-88e4-473c-8e14-f689d8b880ce",
    ],
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.black,
              ))
        ],
        leading: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: const BackIcon(),
        ),
        leadingWidth: 80,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Center(
            child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  width: double.infinity,
                  height: 240.h,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      MainBloc.get(context)
                          .add(ChangeListViewItemIndexEvent(index: index));
                    },
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      alignment: Alignment.center,
                      width: 400.w,
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(product.productImages[index]),
                      ),
                    ),
                    itemCount: product.productImages.length,
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(30.r),
                    child: InkWellWidget(
                        onTap: () {},
                        child: Icon(
                          Icons.share_outlined,
                          size: 35.r,
                          color: mainColor,
                        )))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: product.productImages.map((e) {
                return Container(
                  height: 30.w,
                  width: 30.w,
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: MainBloc.get(context).currentIndex ==
                          product.productImages.indexOf(e)
                      ? BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          gradient: RadialGradient(colors: [
                            mainColor,
                            secondaryColor,
                            Theme.of(context).scaffoldBackgroundColor,
                          ]))
                      : const BoxDecoration(),
                  child: Container(
                    margin: EdgeInsets.all(7.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(222.r),
                      color: MainBloc.get(context).currentIndex ==
                              product.productImages.indexOf(e)
                          ? mainColor
                          : secondaryColor,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 38.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 23.w,
                      ),
                      SizedBox(
                        width: 220.w,
                        child: Text(
                          product.productName,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .color!
                                      .withOpacity(.49),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.sp),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${product.productPrice}\$",
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: const Color(0xFFFF0000),
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "${product.productReviews.length} ${AppLocalizations.of(context)!.review}",
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .headline3!
                                .color!
                                .withOpacity(.7),
                            fontSize: 16.sp),
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Colors.amber.withOpacity(.7),
                        size: 26.r,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "${product.productRate}",
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .headline3!
                                .color!
                                .withOpacity(.7),
                            fontSize: 16.sp),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25.h, bottom: 23.h),
                    child: Text(
                      product.productDescription,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? const Color(0x73484848)
                                : const Color(0xFF777777),
                            height: 2,
                            fontSize: 17.sp,
                          ),
                    ),
                  ),
                  Divider(
                      thickness: 3.h,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.white30
                          : Colors.grey[400]!),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.selectQuantity,
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .textTheme
                                .headline3!
                                .color!
                                .withOpacity(.76)),
                      ),
                      const Spacer(),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(52220.r)),
                        elevation: 1,
                        child: Container(
                          margin: EdgeInsets.all(2.r),
                          child: InkWellWidget(
                              focusColor: Colors.black12,
                              child: const Icon(
                                Icons.remove,
                                color: mainColor,
                              ),
                              onTap: () {}),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          MainBloc.get(context).numberOfItems.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(color: mainColor),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(52220.r)),
                        elevation: 1,
                        child: Container(
                          margin: EdgeInsets.all(2.r),
                          child: InkWellWidget(
                              focusColor: Colors.black12,
                              child: const Icon(
                                Icons.add,
                                color: mainColor,
                              ),
                              onTap: () {}),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Divider(
                      thickness: 3.h,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.white30
                          : Colors.grey[400]!),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.review,
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .textTheme
                                .headline3!
                                .color!
                                .withOpacity(.76)),
                      ),
                      const Spacer(),
                      InkWellWidget(
                          focusColor: Colors.black12,
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: mainColor,
                            size: 40.r,
                          ),
                          onTap: () {}),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    width: double.infinity,
                    height: 58.h,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(width: 2.5, color: mainColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(),
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 30.r,
                            color: mainColor,
                          ),
                          Text(
                            AppLocalizations.of(context)!.addToCart,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: mainColor,
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.w600),
                          ),
                          Container(),
                          Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
      },
    );
  }
}
