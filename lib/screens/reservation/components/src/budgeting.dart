import 'package:done_app/blocs/reservation/bloc.dart';
import 'package:done_app/screens/components/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetingWidget extends StatelessWidget {
  const BudgetingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        CustomElevatedButton(
          text: 'Continue',
          onPressed: () {
            BlocProvider.of<ReservationBloc>(context)
                .add(const GetBudgetsRequested());
          },
        ),
      ],
    );
  }
}
