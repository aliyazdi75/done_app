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
      yield* _mapGetLocationsToState();
    } else if (event is CancelRequested) {
      yield const ReservationState();
    }
  }

  Stream<ReservationState> _mapGetLocationsToState() async* {
    yield state.copyWith(status: ReservationStatus.loading);
    try {
      final budgets = await reservationRepository.getBudgets();
      yield state.copyWith(
        status: ReservationStatus.naming,
        budgets: budgets.budgets.toList(),
      );
    } on Exception {
      yield state.copyWith(status: ReservationStatus.failure);
    }
  }
}
