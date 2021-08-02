import 'package:done_app/blocs/reservation/bloc.dart';
import 'package:done_app/data/constants/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/index.dart';

class ReservationSheet extends StatelessWidget {
  const ReservationSheet({Key? key, required this.reservationBloc})
      : super(key: key);

  final ReservationBloc reservationBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: reservationBloc,
      child: BlocBuilder<ReservationBloc, ReservationState>(
        builder: (context, state) {
          final isNaming = state.status == ReservationStatus.naming;
          final isBudgeting = state.status == ReservationStatus.budgeting;
          return Scaffold(
            body: Column(
              children: [
                ListTile(
                  leading: isNaming
                      ? null
                      : IconButton(
                          onPressed: () =>
                              BlocProvider.of<ReservationBloc>(context)
                                  .add(const PreviousStepRequested()),
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                  title: Text(
                    isNaming
                        ? 'Name'
                        : isBudgeting
                            ? 'Budget'
                            : 'Summery',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  subtitle: const Text('Book video call for quote'),
                  trailing: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                LinearProgressIndicator(value: state.stepCount / 3),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isNaming || isBudgeting)
                          Text(
                            isNaming ? description[0] : description[1],
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 15.0),
                          ),
                        const SizedBox(height: 42.0),
                        Expanded(
                          child: isNaming
                              ? const NamingWidget()
                              : isBudgeting
                                  ? const BudgetingWidget()
                                  : const ConfirmationWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
