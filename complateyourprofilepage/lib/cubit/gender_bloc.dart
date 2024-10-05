import 'package:flutter_bloc/flutter_bloc.dart';

class GenderBloc extends Cubit<String?>{
  GenderBloc() : super(null);

void selectGender(String gender){
  emit(gender);
}
}