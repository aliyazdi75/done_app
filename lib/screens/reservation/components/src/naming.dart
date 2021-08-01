import 'package:done_app/blocs/reservation/bloc.dart';
import 'package:done_app/screens/components/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NamingWidget extends StatefulWidget {
  const NamingWidget({Key? key}) : super(key: key);

  @override
  State<NamingWidget> createState() => _NamingWidgetState();
}

class _NamingWidgetState extends State<NamingWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController(
        text: BlocProvider.of<ReservationBloc>(context).state.name);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onSubmit() {
      if (formKey.currentState!.validate()) {
        BlocProvider.of<ReservationBloc>(context).add(const NamingSubmitted());
      }
    }

    return Column(
      children: [
        Form(
          key: formKey,
          child: TextFormField(
            controller: textEditingController,
            onFieldSubmitted: (name) => onSubmit(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (name) {
              if (name!.isEmpty) {
                return 'Name must not be empty';
              }
              return null;
            },
            onChanged: (password) => BlocProvider.of<ReservationBloc>(context)
                .add(NameChanged(password)),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              labelText: 'Your full name',
            ),
          ),
        ),
        Expanded(child: Container()),
        CustomElevatedButton(
          text: 'Continue',
          onPressed: onSubmit,
        ),
      ],
    );
  }
}
