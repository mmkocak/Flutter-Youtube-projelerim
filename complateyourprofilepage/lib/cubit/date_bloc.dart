import 'package:flutter_bloc/flutter_bloc.dart';

class DateBloc extends Cubit<DateTime>{
  DateBloc() : super(DateTime.now());
  void selectDate(DateTime newdate){
    emit(newdate);
  }
}