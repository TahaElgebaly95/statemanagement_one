import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment_one/cubit/to-do_cubit.dart';
import 'package:state_managment_one/cubit/to_do_state.dart';

class TeField extends StatelessWidget {
  const TeField({super.key});

  @override
  Widget build(BuildContext context) {
    return
     BlocConsumer<ToDoCubit , ToDoState>(
       builder: (context, state){
         var cubit = ToDoCubit.get(context);
       return  Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            Text(
             'Add Task',
             style:
             TextStyle(color: Colors.yellow.shade700, fontSize: 30),
           ),
           TextFormField(
             style: const TextStyle(color: Colors.white),
             controller: cubit.titleController,
             decoration: InputDecoration(
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(16),
                 borderSide:  BorderSide(
                     color: Colors.yellow.shade700, width: 3),
               ),
               hintText: 'Title',
               hintStyle:
                TextStyle(color: Colors.yellow.shade700),
             ),
           ),
           TextFormField(
             style: const TextStyle(color: Colors.white),
             controller: cubit.dateController,
             onTap: () {
               showDatePicker(
                   context: context,
                   firstDate: DateTime.now(),
                   lastDate: DateTime(2025))
                   .then((value) {
                 cubit.dateController.text =
                 "${value!.year}-${value.month}-${value.day}";
               });
             },
             decoration: InputDecoration(
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(16),
                 borderSide:  BorderSide(
                     color: Colors.yellow.shade700, width: 3),
               ),
               hintText: 'Date',
               hintStyle:
                TextStyle(color: Colors.yellow.shade700),
             ),
           ),
           TextFormField(
             style: const TextStyle(color: Colors.white),
             controller: cubit.timeController,
             onTap: () {
               showTimePicker(
                   context: context,
                   initialTime: TimeOfDay.now())
                   .then((value) {
                 cubit.timeController.text =
                 "${value!.hour}-${value.minute}";
               });
             },
             decoration: InputDecoration(
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(16),
                 borderSide:  BorderSide(
                   color: Colors.yellow.shade700,
                   width: 6,
                 ),
               ),
               hintText: 'Time',
               hintStyle:
                TextStyle(color: Colors.yellow.shade700),
             ),
           ),
           const SizedBox(height: 30),
           Center(
             child: ElevatedButton(
               style: ElevatedButton.styleFrom(

                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                   backgroundColor: Colors.yellow.shade700),
               onPressed: () {
                 cubit.addTask();
               },
               child: const Text(
                 'Add Task',
                 style: TextStyle(color: Colors.white,fontSize: 20),
               ),
             ),
           ),
         ],
       );
     }, listener: (context, state){},);
  }
}
