import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/core/consts/colors.dart';
import 'package:furniture_store/core/widget/back_icon.dart';
import 'package:furniture_store/featuers/auth/presentation/widgets/inkwell_widget.dart';
import 'package:furniture_store/featuers/main/presentation/manager/main_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:shimmer/shimmer.dart';

class MapScreen extends StatelessWidget {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static CameraPosition? cameraPosition;

  GoogleMapController? mapController;

  var image =
      "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: MainBloc.get(context).placemarks != null
              ? Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    GoogleMap(
                      markers: MainBloc.get(context).markers.values.toSet(),
                      mapType: MapType.hybrid,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) async {
                        mapController = controller;
                        state is GetCurrentLocationLoadedState
                            ? mapController!.animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                                target: LatLng(state.position.latitude,
                                    state.position.longitude),
                                zoom: 16.151926040649414,
                              )))
                            : null;
                      },
                      zoomControlsEnabled: false,
                      compassEnabled: false,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.h),
                            child: BackIcon(),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            AppLocalizations.of(context)!.setLocation,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                ?.copyWith(color: Colors.white),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(55555.w)),
                            child: Container(
                              width: 58.r,
                              height: 58.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55555.r),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: CachedNetworkImage(
                                width: 48.r,
                                height: 48.r,
                                imageUrl: image,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    width: 48.r,
                                    height: 48.r,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.circular(5555555.0),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        height: MainBloc.get(context).containerHeight.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: 32.w,
                          vertical: 35.h,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(seconds: 5),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            AnimatedContainer(
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(seconds: 4),
                              height:
                                  MainBloc.get(context).containerHeight.h - 20,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(32.r),
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                children: [
                                  AnimatedOpacity(
                                    // If the widget is visible, animate to 0.0 (invisible).
                                    // If the widget is hidden, animate to 1.0 (fully visible).
                                    opacity: !MainBloc.get(context).visible
                                        ? 1.0
                                        : 0.0,
                                    duration: const Duration(milliseconds: 500),
                                    // The green box must be a child of the AnimatedOpacity widget.
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      size: 28.r,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  AnimatedOpacity(
                                    // If the widget is visible, animate to 0.0 (invisible).
                                    // If the widget is hidden, animate to 1.0 (fully visible).
                                    opacity: !MainBloc.get(context).visible
                                        ? 1.0
                                        : 0.0,
                                    duration: const Duration(milliseconds: 500),
                                    // The green box must be a child of the AnimatedOpacity widget.
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${MainBloc.get(context).position!.longitude}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          "${MainBloc.get(context).placemarks![0].country ?? ""} ${MainBloc.get(context).placemarks![0].country == "" ? "" : "-"} ${MainBloc.get(context).placemarks![0].street ?? ""}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 45.w,
                                      height: 45.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(555.r)),
                                      child: InkWellWidget(
                                        onTap: () {
                                          MainBloc.get(context).add(
                                              ChangeContainerHeightEvent());
                                        },
                                        child: Icon(
                                          MainBloc.get(context).visible
                                              ? Icons.done_rounded
                                              : Icons.search_rounded,
                                          color: mainColor,
                                        ),
                                      ),
                                    ),
                                    AnimatedOpacity(
                                      // If the widget is visible, animate to 0.0 (invisible).
                                      // If the widget is hidden, animate to 1.0 (fully visible).
                                      opacity: !MainBloc.get(context).visible
                                          ? 1.0
                                          : 0.0,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      // The green box must be a child of the AnimatedOpacity widget.
                                      child: Container(
                                        width: 45.w,
                                        height: 45.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(555.r)),
                                        child: InkWellWidget(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.check_rounded,
                                            color: mainColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
