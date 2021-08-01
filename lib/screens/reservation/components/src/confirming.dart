import 'package:done_app/blocs/reservation/bloc.dart';
import 'package:done_app/core/index.dart';
import 'package:done_app/screens/components/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationWidget extends StatelessWidget {
  const ConfirmationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationBloc, ReservationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 15.0),
            ),
            Text(
              state.name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Divider(),
            Text(
              'Budget',
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 15.0),
            ),
            Text(
              state.selectedBudget!.minimum == null
                  ? 'Up to ${priceCovert(state.selectedBudget!.maximum!)} kr'
                  : state.selectedBudget!.maximum == null
                      ? 'Over ${priceCovert(state.selectedBudget!.minimum!)} kr'
                      : '${priceCovert(state.selectedBudget!.maximum!)} - ${priceCovert(state.selectedBudget!.minimum!)} kr',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Divider(),
            Expanded(child: Container()),
            Center(
              child: CustomElevatedButton(
                text: 'Confirm Booking',
                loadingText: 'Confirming...',
                isLoading:
                    state.status == ReservationStatus.confirmationLoading,
                onPressed: () {
                  BlocProvider.of<ReservationBloc>(context)
                      .add(const ConfirmationSubmitted());
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
