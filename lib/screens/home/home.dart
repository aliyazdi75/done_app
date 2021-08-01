import 'package:done_app/blocs/reservation/bloc.dart';
import 'package:done_app/repositories/reservation/index.dart';
import 'package:done_app/screens/components/index.dart';
import 'package:done_app/screens/reservation/reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ReservationRepository reservationRepository = ReservationRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => reservationRepository,
        child: BlocProvider(
          create: (context) =>
              ReservationBloc(reservationRepository: reservationRepository),
          child: BlocListener<ReservationBloc, ReservationState>(
            listener: (context, state) {
              switch (state.status) {
                case ReservationStatus.start:
                  BlocProvider.of<ReservationBloc>(context)
                      .add(const ReservationStarted());
                  showModalBottomSheet<bool>(
                    context: context,
                    isDismissible: false,
                    enableDrag: false,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    builder: (_) {
                      return ReservationSheet(
                        reservationBloc:
                            BlocProvider.of<ReservationBloc>(context),
                      );
                    },
                  ).then((success) {
                    if (success != null && success) {
                    } else {
                      BlocProvider.of<ReservationBloc>(context)
                          .add(const CancelRequested());
                    }
                  });
                  break;
                case ReservationStatus.failure:
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text('Failure due to getting Budgets!'),
                      ),
                    );
                  break;
                default:
                  break;
              }
            },
            child: BlocBuilder<ReservationBloc, ReservationState>(
              builder: (context, state) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomElevatedButton(
                      text: 'Start Booking',
                      isLoading: state.status == ReservationStatus.loading,
                      onPressed: () {
                        if (state.status == ReservationStatus.initial) {
                          BlocProvider.of<ReservationBloc>(context)
                              .add(const GetBudgetsRequested());
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
