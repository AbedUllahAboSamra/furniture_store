import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/core/consts/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/widget/back_icon.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/review.dart';
import '../manager/main_bloc.dart';

class ReviewsScreen extends StatelessWidget {
  final product = const Product(
    productId: 'productId',
    productName: 'productName',
    productCategory: "asd",
    productReviews: [
      Review(
          reviewId: 'reviewId',
          reviewerName: 'reviewerName',
          reviewerRate: 5.0,
          reviewerId: 'reviewerId',
          reviewDate: "20/12/2002",
          reviewerImageUrl:
              "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
      Review(
          reviewId: 'reviewId',
          reviewerName: 'reviewerName',
          reviewerRate: 5.0,
          reviewerId: 'reviewerId',
          reviewDate: "20/12/2002",
          reviewerImageUrl:
              "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
      Review(
          reviewId: 'reviewId',
          reviewerName: 'reviewerName',
          reviewerRate: 5.0,
          reviewerId: 'reviewerId',
          reviewDate: "20/12/2002",
          reviewerImageUrl:
              "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
      Review(
          reviewId: 'reviewId',
          reviewerName: 'reviewerName',
          reviewerRate: 5.0,
          reviewerId: 'reviewerId',
          reviewDate: "20/12/2002",
          reviewerImageUrl:
              "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
    ],
    productRate: 4.2,
    productPrice: 300,
    productDescription: 'asdasd asdijaofi jefa oijsdpfih aodsifhm jodsaif ',
    productImages: [
      "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Mask%20Group%202.png?alt=media&token=8d42573b-c304-4138-94c5-9ddb9d3244bd",
      "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Mask%20Group%202.png?alt=media&token=8d42573b-c304-4138-94c5-9ddb9d3244bd",
      "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Mask%20Group%202.png?alt=media&token=8d42573b-c304-4138-94c5-9ddb9d3244bd",
      "https://firebasestorage.googleapis.com/v0/b/furniture-store-9c9db.appspot.com/o/Masks%20Group%202.png?alt=media&token=0fca109f-88e4-473c-8e14-f689d8b880ce",
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return BlocConsumer<MainBloc, MainState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      return CustomScrollView(
          // Setting floatHeaderSlivers to true is required in order to float
          // the outer slivers over the inner scrollable.
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  AppLocalizations.of(context)!.review,
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .headline2!
                          .color!
                          .withOpacity(.6),
                      fontSize: 25.sp),
                ),
              ),
              centerTitle: true,
              leading: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: const BackIcon(),
              ),
              leadingWidth: 80,
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(
                  top: 30.h,
                  bottom: 30.h,
                  left: 32.w,
                  right: 32.w,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 75.h,
                          alignment: Alignment.center,
                          child: Text(
                            product.productRate.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 60.sp,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .color!
                                    .withOpacity(.76)),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(
                          "${product.productReviews.length} ${AppLocalizations.of(context)!.review}",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .color!
                                  .withOpacity(.6)),
                        ),
                        SizedBox(
                          width: 16.w,
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
                          product.productRate.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .color!
                                  .withOpacity(.6)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildReviewItem(context: context, index: index);
              },
              childCount: product.productReviews.length,
            )),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 45.h,
                margin: EdgeInsets.symmetric(
                  horizontal: 32.w,
                  vertical: 16.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? Colors.grey[200]
                              : Colors.grey[800],
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: TextFormField(
                          cursorColor: Colors.grey[800],
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            prefixIcon: Container(
                              margin: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(55555),
                                  color: secondaryColor),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 24.w),
                      child: Icon(Icons.send_outlined, color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
            )
          ]);
    });
  }

  Widget _buildReviewItem({required int index, required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(
        left: 32.w,
        right: 32.w,
      ),
      child: Column(
        children: [
          Divider(
              thickness: 2.5.h,
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.white30
                      : Colors.grey[400]!),
          SizedBox(
            height: 16.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 58.r,
                height: 58.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55555.r),
                ),
                clipBehavior: Clip.hardEdge,
                child: CachedNetworkImage(
                  width: 48.r,
                  height: 48.r,
                  imageUrl: product.productReviews[index].reviewerImageUrl,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      width: 48.r,
                      height: 48.r,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5555555.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.productReviews[index].reviewerName,
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.dark
                                      ? Colors.white.withOpacity(.7)
                                      : Colors.black.withOpacity(.7),
                            ),
                      ),
                      SizedBox(
                        width: 55.w,
                      ),
                      Text(
                        product.productReviews[index].reviewDate,
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.dark
                                      ? Colors.white.withOpacity(.7)
                                      : Colors.black.withOpacity(.4),
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Colors.amber.withOpacity(.7),
                        size: 26.r,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        product.productRate.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .textTheme
                                .headline4!
                                .color!
                                .withOpacity(.6)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    height: 8.h,
                    width: 100.w,
                    margin: EdgeInsetsDirectional.only(start: 80.w),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(555555)),
                  ),
                  Container(
                    height: 10.h,
                    width: 200.w,
                    margin: EdgeInsetsDirectional.only(top: 5.h),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(555555)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    width: 270.w,
                    child: Text(
                      product.productDescription,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Colors.white.withOpacity(.7)
                                : Colors.black.withOpacity(.7),
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 85.h,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  child: Container(
                    width: 75.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: product.productReviews[index].reviewerImageUrl,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          width: 48.r,
                          height: 48.r,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5555555.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 5.w,
                );
              },
              itemCount: product.productImages.length >= 4
                  ? index.isEven
                      ? 4
                      : 3
                  : product.productImages.length,
            ),
          ),
          SizedBox(
            height: 8.h,
          )
        ],
      ),
    );
  }
}
