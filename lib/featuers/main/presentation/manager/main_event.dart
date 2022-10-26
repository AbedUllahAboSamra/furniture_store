part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeListViewItemIndexEvent extends MainEvent {
  final int index;

  const ChangeListViewItemIndexEvent({
    required this.index,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        index,
      ];
}
// location event
class GetCurrentLocationEvent extends MainEvent {}
//container height
class ChangeContainerHeightEvent extends MainEvent {}


