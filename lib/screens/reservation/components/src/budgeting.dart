import 'package:done_app/blocs/reservation/bloc.dart';
import 'package:done_app/core/index.dart';
import 'package:done_app/data/constants/index.dart';
import 'package:done_app/screens/components/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetingWidget extends StatelessWidget {
  const BudgetingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationBloc, ReservationState>(
      builder: (context, state) {
        final budgets = state.budgets;
        final selectedBudget = state.selectedBudget;
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: budgets.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 44.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: const BorderSide().copyWith(
                          width: selectedBudget == budgets[index] ? 2.0 : null,
                          color: selectedBudget == budgets[index]
                              ? accentColor
                              : Colors.grey,
                        ),
                      ),
                      child: Text(
                        budgets[index].minimum == null
                            ? 'Up to ${priceCovert(budgets[index].maximum!)} kr'
                            : budgets[index].maximum == null
                                ? 'Over ${priceCovert(budgets[index].minimum!)} kr'
                                : '${priceCovert(budgets[index].minimum!)} - ${priceCovert(budgets[index].maximum!)} kr',
                      ),
                      onPressed: () {
                        BlocProvider.of<ReservationBloc>(context)
                            .add(BudgetChanged(budgets[index]));
                      },
                    ),
                  );
                },
              ),
            ),
            CustomElevatedButton(
              text: 'Continue',
              onPressed: () {
                BlocProvider.of<ReservationBloc>(context)
                    .add(const BudgetingSubmitted());
              },
            ),
          ],
        );
      },
    );
  }
}
