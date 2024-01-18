import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment_one/cubit/to_do_state.dart';

import '../model/task_model.dart';

class ToDoCubit extends Cubit<ToDoState>{
  ToDoCubit() : super(InitState());

  static ToDoCubit get(context)=> BlocProvider.of<ToDoCubit>(context);

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  List<TaskModel> taskModel=[];

  void addTask(){
    taskModel.add(TaskModel(title: titleController.text, date: dateController.text, time: timeController.text));
    emit(AddTask());
  }

}
