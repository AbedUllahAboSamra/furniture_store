import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/error/exceptions.dart';

abstract class MainRemoteDataSource {
  Future<Position> getCurrentPosition();
}

class MainRemoteDataSourceImpl implements MainRemoteDataSource {
  @override
  Future<Position> getCurrentPosition() async {
    // TODO: implement getCurrentPosition
    bool serviceEnabled;
    LocationPermission permission;

    permission = await methodCheckLocationPermission();
    if (permission == LocationPermission.deniedForever) {
      throw MapServerErrorException();
    }
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
     bool isOpened = await Geolocator.openLocationSettings();
     if(!isOpened){
       throw PermissionLocationNotEnabledException();
     }
    }
    return await Geolocator.getCurrentPosition();
  }


  Future<LocationPermission> methodCheckLocationPermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw PermissionDeniedExceptionA();
      }
    }
    return permission;
  }
}
