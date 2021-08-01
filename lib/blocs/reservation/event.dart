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
  List<Object?> get props => [name];
}

class ReservationStarted extends ReservationEvent {
  const ReservationStarted();
}

class NamingSubmitted extends ReservationEvent {
  const NamingSubmitted();
}

class BudgetChanged extends ReservationEvent {
  const BudgetChanged(this.budget);

  final Budget budget;

  @override
  List<Object?> get props => [budget];
}

class BudgetingSubmitted extends ReservationEvent {
  const BudgetingSubmitted();
}

class ConfirmationSubmitted extends ReservationEvent {
  const ConfirmationSubmitted();
}

class ResetRequested extends ReservationEvent {
  const ResetRequested();
}

class PreviousStepRequested extends ReservationEvent {
  const PreviousStepRequested();
}

class CancelRequested extends ReservationEvent {
  const CancelRequested();
}
