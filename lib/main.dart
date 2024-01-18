import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment_one/cubit/to-do_cubit.dart';
import 'package:state_managment_one/screens/to_do_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ToDoCubit(),)
    ], child:  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoScreen(),
    ),)

  );
}
  