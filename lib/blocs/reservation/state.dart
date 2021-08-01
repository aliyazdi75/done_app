part of 'bloc.dart';

enum ReservationStatus {
  initial,
  loading,
  naming,
  budgeting,
  confirmation,
  success,
  failure,
}

class ReservationState extends Equatable {
  const ReservationState({
    this.status = ReservationStatus.initial,
    this.budgets = const <Budget>[],
  });

  final ReservationStatus status;
  final List<Budget> budgets;

  ReservationState copyWith({
    ReservationStatus? status,
    List<Budget>? budgets,
  }) {
    return ReservationState(
      status: status ?? this.status,
      budgets: budgets ?? this.budgets,
    );
  }

  @override
  List<Object?> get props => [status, budgets];
}
