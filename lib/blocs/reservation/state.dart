part of 'bloc.dart';

enum ReservationStatus {
  initial,
  homeLoading,
  start,
  naming,
  budgeting,
  confirming,
  confirmationLoading,
  success,
  failure,
}

class ReservationState extends Equatable {
  const ReservationState({
    this.status = ReservationStatus.initial,
    this.name = '',
    this.selectedBudget,
    this.stepCount = 1,
    this.budgets = const <Budget>[],
  });

  final ReservationStatus status;
  final String name;
  final Budget? selectedBudget;
  final int stepCount;
  final List<Budget> budgets;

  ReservationState copyWith({
    ReservationStatus? status,
    String? name,
    Budget? selectedBudget,
    int? stepCount,
    List<Budget>? budgets,
  }) {
    return ReservationState(
      status: status ?? this.status,
      name: name ?? this.name,
      selectedBudget: selectedBudget ?? this.selectedBudget,
      stepCount: stepCount ?? this.stepCount,
      budgets: budgets ?? this.budgets,
    );
  }

  @override
  List<Object?> get props => [status, name, selectedBudget, stepCount];
}
