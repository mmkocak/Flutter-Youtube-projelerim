import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lcyp/cubit/date_bloc.dart';
import 'package:lcyp/cubit/gender_bloc.dart';
import 'package:lcyp/page/lcyp_page.dart';

void main(List<String> args) {
  runApp(Main());
}
class Main extends StatelessWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenderBloc()),
        BlocProvider(create: (context)=> DateBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LcypPage(),
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      ),
    );
  }
}