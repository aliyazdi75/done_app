part of 'bloc.dart';

enum ReservationStatus {
  initial,
  loading,
  start,
  naming,
  budgeting,
  confirmation,
  success,
  failure,
}

class ReservationState extends Equatable {
  const ReservationState({
    this.status = ReservationStatus.initial,
    this.name = '',
    this.budgets = const <Budget>[],
  });

  final ReservationStatus status;
  final String name;
  final List<Budget> budgets;

  ReservationState copyWith({
    ReservationStatus? status,
    String? name,
    List<Budget>? budgets,
  }) {
    return ReservationState(
      status: status ?? this.status,
      name: name ?? this.name,
      budgets: budgets ?? this.budgets,
    );
  }

  @override
  List<Object?> get props => [status, name];
}
