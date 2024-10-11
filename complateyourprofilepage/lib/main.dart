import 'package:compileprojects/date_cubit.dart';
import 'package:compileprojects/gender_cubit.dart';
import 'package:compileprojects/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> GenderCubit()),
        BlocProvider(create: (context)=> DateCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: const HomePage(),
      ),
    );
  }
}