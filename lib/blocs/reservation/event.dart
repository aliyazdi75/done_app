part of 'bloc.dart';

@immutable
abstract class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object?> get props => [];
}

class GetBudgetsRequested extends ReservationEvent {
  const GetBudgetsRequested();
}

class CancelRequested extends ReservationEvent {
  const CancelRequested();
}
