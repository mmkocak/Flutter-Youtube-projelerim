import 'package:compileprojects/date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

DateTime selectedDate = DateTime.now();
mixin DateTimePicker {
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialDate: context.read<DateCubit>().state);
        if(picked != null){
          context.read<DateCubit>().selectDate(picked);
        }
  }
}
