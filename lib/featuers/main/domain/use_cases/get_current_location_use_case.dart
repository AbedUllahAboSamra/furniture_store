import 'package:dartz/dartz.dart';
import 'package:furniture_store/core/error/failuers.dart';
import 'package:furniture_store/featuers/main/domain/repository/main_repository.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';

class GetCurrentLocationUseCase {
  final MainRepository repository;

  const GetCurrentLocationUseCase({
    required this.repository,
  });

  Future<Either<Failure, Position>> call() async {
    return await repository.getCurrentLocation();
  }
}
