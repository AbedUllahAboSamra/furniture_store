part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

// list item change
class ChangingItemInDetailsScreenList extends MainState {}

class ChangedItemInDetailsScreenList extends MainState {}

// location state
class GetCurrentLocationLoadingState extends MainState {}

class GetCurrentLocationLoadedState extends MainState {
  final Position position;
  final List<Placemark> placemarks;

  const GetCurrentLocationLoadedState(
      {required this.position, required this.placemarks});
}

class GetCurrentLocationErrorState extends MainState {
  final String error;

  const GetCurrentLocationErrorState({
    required this.error,
  });

  @override
  List<Object> get props => [
        error,
      ];
}


class ChangingContainer extends MainState {}
class ChangedContainer extends MainState {}
