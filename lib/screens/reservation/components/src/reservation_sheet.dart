import 'package:done_app/blocs/reservation/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservationSheet extends StatelessWidget {
  const ReservationSheet({Key? key, required this.reservationBloc})
      : super(key: key);

  final ReservationBloc reservationBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: reservationBloc,
      child: BlocListener<ReservationBloc, ReservationState>(
        listener: (context, state) {
          // TODO: implement listener}
        },
        child: BlocBuilder<ReservationBloc, ReservationState>(
          builder: (context, state) {
            return Column(
              children: [
                ListTile(
                  title: Text(
                    'Name',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  subtitle: const Text('Book video call for quote'),
                  trailing: TextButton(
                    onPressed: () {
                      BlocProvider.of<ReservationBloc>(context)
                          .add(const CancelRequested());
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                LinearProgressIndicator(
                  value: (state.status == ReservationStatus.naming
                          ? 1
                          : state.status == ReservationStatus.budgeting
                              ? 2
                              : 3) /
                      3,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
