import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lcyp/cubit/date_bloc.dart';
DateTime selectedDate = DateTime.now();
mixin DatePickerMixin{
  Future<void> selectDate(BuildContext context) async {
    
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: context.read<DateBloc>().state,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      context.read<DateBloc>().selectDate(picked);
    }
  }
}
