import 'package:flutter_bloc/flutter_bloc.dart';

class GenderCubit extends Cubit<String?>{
  GenderCubit():super(null);
  selectGender(String? newvalue){
    emit(newvalue);
  }
}