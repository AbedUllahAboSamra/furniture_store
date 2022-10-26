


import 'package:dartz/dartz.dart';

import 'package:furniture_store/core/error/failuers.dart';
import 'package:furniture_store/core/network/network.dart';
import 'package:furniture_store/featuers/main/data/datasources/remote/main_remote_data_source.dart';
import 'package:geolocator/geolocator.dart';


import '../../../../core/error/exceptions.dart';
import '../../domain/repository/main_repository.dart';

class MainRepositoryImpl implements MainRepository{

  final NetworkInfo networkInfo ;
  final MainRemoteDataSource remoteDataSource ;

 const MainRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource
});

  @override
  Future<Either<Failure, Position>> getCurrentLocation() async {
    // TODO: implement getCurrentLocation
       bool connection = await networkInfo.isConnected;

     if(connection){

       try{
         Position position = await remoteDataSource.getCurrentPosition();
         print("${position}  position abed");
        return right(position);
       }  catch  (ex) {
         print('Exception');
       if (ex is PermissionLocationNotEnabledException){
         return left(LocationGpsFailure());
       }else{

         return left(ServerLocationFailure());

       }

       }
     }
     else{
       return left(ServerLocationFailure());
     }


  }






}