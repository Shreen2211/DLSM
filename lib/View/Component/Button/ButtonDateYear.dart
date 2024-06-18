import 'package:dlsm/ViewModel/Bloc/AuthCubit/auth_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonYear extends StatelessWidget {
  const ButtonYear({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return DottedBorder(
      strokeWidth: 1,
      color: Colors.black,
      dashPattern: const [3, 2],
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: const Size(double.infinity, 60),
            textStyle: const TextStyle(fontSize: 20)),
        onPressed: (){
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: SizedBox(
                      width: 300,
                      height: 300,
                      child: YearPicker(
                        firstDate: DateTime(DateTime.now().year - 100, 1),
                        lastDate: DateTime(DateTime.now().year),
                        initialDate:AuthCubit.get(context).history??DateTime.now(),
                        selectedDate: AuthCubit.get(context).history??DateTime.now(), // Use selectedDate if not null, otherwise use DateTime.now()
                        onChanged: (DateTime dateTime) {
                          AuthCubit.get(context).businessYear(dateTime); // Update selectedDate when a new date is chosen
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    content: const Text('History Business From Year:'),
                  ),
                );
        },
        child: Row(
          children: [
            const Icon(Icons.date_range_sharp,color: Colors.grey,),
            Text('\t From ${AuthCubit.get(context).history?.year??' Business History'}', style: const TextStyle(color: Colors.grey,fontSize: 15)),
          ],
        ),
      ),
    );
  },
);
  }
}
