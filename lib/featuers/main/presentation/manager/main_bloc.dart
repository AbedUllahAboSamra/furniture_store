import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/core/error/failuers.dart';
import 'package:furniture_store/core/error/messages.dart';
import 'package:furniture_store/featuers/main/domain/use_cases/get_current_location_use_case.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  static MainBloc get(context) => BlocProvider.of(context);

  final GetCurrentLocationUseCase getCurrentLocationUseCase;

  int currentIndex = 0;
  int numberOfItems = 1;
  double containerHeight = 135;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  var address = '';
  List<Placemark>? placemarks ;
  Position? position;
  bool visible = false ;
  MainBloc({
    required this.getCurrentLocationUseCase,
  }) : super(MainInitial()) {
    on<MainEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is ChangeListViewItemIndexEvent) {
        print('object................');
        emit(ChangingItemInDetailsScreenList());
        print(currentIndex.toString() + "BB");
        currentIndex = event.index;
        print(currentIndex.toString() + "AA");
        emit(ChangedItemInDetailsScreenList());
      }
      else if (event is GetCurrentLocationEvent) {
        emit(GetCurrentLocationLoadingState());
        var errorOrPosition = await getCurrentLocationUseCase.call();
        errorOrPosition.fold(
          (failure) {
            emit(GetCurrentLocationErrorState(
                error: _mapFailureToMessage(failure: failure)));
          },
          (position) {
            final marker = Marker(
              markerId: const MarkerId('userLocation'),
              position: LatLng(position.latitude, position.longitude),
              // icon: BitmapDescriptor.,
              infoWindow: const InfoWindow(
                title: 'title',
                snippet: 'address',
              ),
            );
            markers[const MarkerId('userLocation')] = marker;
            this.position = position;
            getLocationAddress(position: position);
          },
        );


      }
      else if (event is ChangeContainerHeightEvent){

        emit(ChangingContainer());

        if(containerHeight == 135){
          containerHeight = 600;
          visible = true ;
        }else{
          containerHeight = 135;
          visible = false ;
        }
        emit(ChangedContainer());
      }
    });
  }

  String _mapFailureToMessage({required Failure failure}) {
    switch (failure.runtimeType) {
      case LocationGpsFailure:
        return GPS_SERVICE_NOT_ENABLE;
      case ServerLocationFailure:
        return LOCATION_SERVICE_ERROR;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
  getLocationAddress({required Position position}) async {
    List<Placemark> placemarks =  await placemarkFromCoordinates(position.latitude, position.longitude);
    this.placemarks= placemarks;
    emit(GetCurrentLocationLoadedState(position: position,placemarks:placemarks));
  }


}
