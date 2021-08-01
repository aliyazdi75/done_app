import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:done_app/data/models/reservation/index.dart';
import 'package:done_app/repositories/reservation/index.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc({
    required this.reservationRepository,
  }) : super(const ReservationState());

  final ReservationRepository reservationRepository;

  @override
  Stream<ReservationState> mapEventToState(ReservationEvent event) async* {
    if (event is GetBudgetsRequested) {
      yield* _mapGetBudgetsToState();
    } else if (event is ReservationStarted) {
      yield state.copyWith(status: ReservationStatus.naming);
    } else if (event is NameChanged) {
      yield state.copyWith(name: event.name);
    } else if (event is NamingSubmitted) {
      yield state.copyWith(status: ReservationStatus.budgeting, step: 2);
    } else if (event is BudgetChanged) {
      yield state.copyWith(selectedBudget: event.budget);
    } else if (event is BudgetingSubmitted) {
      yield state.copyWith(status: ReservationStatus.confirming, step: 3);
    } else if (event is ConfirmationSubmitted) {
      yield* _mapConfirmingSubmittedToState();
    } else if (event is PreviousStepRequested) {
      yield* _mapPreviousStepRequestedToState();
    } else if (event is CancelRequested) {
      yield state.copyWith(status: ReservationStatus.initial);
    } else if (event is ResetRequested) {
      yield const ReservationState();
    }
  }

  Stream<ReservationState> _mapGetBudgetsToState() async* {
    yield const ReservationState(status: ReservationStatus.homeLoading);
    try {
      final budgets = await reservationRepository.getBudgets();
      yield state.copyWith(
        status: ReservationStatus.start,
        selectedBudget: budgets.budgets.first,
        budgets: budgets.budgets.toList(),
      );
    } on Exception {
      yield state.copyWith(status: ReservationStatus.failure);
    }
  }

  Stream<ReservationState> _mapConfirmingSubmittedToState() async* {
    yield state.copyWith(status: ReservationStatus.confirmationLoading);
    try {
      await reservationRepository.submitReservation();
      yield state.copyWith(status: ReservationStatus.success);
    } on Exception {
      yield state.copyWith(status: ReservationStatus.failure);
    }
  }

  Stream<ReservationState> _mapPreviousStepRequestedToState() async* {
    if (state.status == ReservationStatus.budgeting) {
      yield state.copyWith(status: ReservationStatus.naming);
    } else if (state.status == ReservationStatus.confirming) {
      yield state.copyWith(status: ReservationStatus.budgeting);
    }
  }
}
