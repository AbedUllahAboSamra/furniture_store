


import 'package:dartz/dartz.dart';
import 'package:furniture_store/core/error/failuers.dart';
import 'package:geolocator/geolocator.dart';

abstract class MainRepository {
  Future<Either<Failure,Position>> getCurrentLocation();
}