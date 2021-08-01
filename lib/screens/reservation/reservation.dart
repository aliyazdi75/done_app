import 'package:done_app/blocs/reservation/bloc.dart';
import 'package:done_app/repositories/reservation/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/index.dart';

class ReservationPage extends StatelessWidget {
  ReservationPage({Key? key}) : super(key: key);

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
                case ReservationStatus.naming:
                  showModalBottomSheet<void>(
                      context: context,
                      isDismissible: false,
                      enableDrag: false,
                      useRootNavigator: true,
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
                    child: ElevatedButton(
                      onPressed: () {
                        if (state.status == ReservationStatus.initial) {
                          BlocProvider.of<ReservationBloc>(context)
                              .add(const GetBudgetsRequested());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(336, 44)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (state.status == ReservationStatus.loading) ...[
                            const CustomCupertinoActivityIndicator(),
                            const SizedBox(width: 8.0),
                          ],
                          const Text('Start Booking'),
                        ],
                      ),
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
