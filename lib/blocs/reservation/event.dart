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

class NameChanged extends ReservationEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object?> get props => [];
}

class ReservationStarted extends ReservationEvent {
  const ReservationStarted();
}

class NamingSubmitted extends ReservationEvent {
  const NamingSubmitted();
}

class PreviousStepRequested extends ReservationEvent {
  const PreviousStepRequested();
}

class CancelRequested extends ReservationEvent {
  const CancelRequested();
}
