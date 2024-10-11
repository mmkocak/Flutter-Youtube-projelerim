import 'package:flutter_bloc/flutter_bloc.dart';

class DateCubit extends Cubit<DateTime?>{
  DateCubit():super(null);
  selectDate(DateTime newdate){
    emit(newdate);
  }
}