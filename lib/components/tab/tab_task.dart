import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment_one/cubit/to-do_cubit.dart';
import 'package:state_managment_one/model/task_model.dart';
import '../../utils/text_style.dart';

class TabTask extends StatelessWidget {

  const TabTask({required this.taskModel, super.key});

  final TaskModel taskModel;
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        var cubit = ToDoCubit.get(context);
        Tab(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(cubit.taskModel[index].title,
                      style: AppTextStyle.titleText),
                  Text(cubit.taskModel[index].date,
                      style: AppTextStyle.descriptionText),
                  Text(cubit.taskModel[index].time,
                      style: AppTextStyle.descriptionText),
                ],
              ),
              Spacer(),
              Icon(
                Icons.done,
                color: Colors.amber,
                size: 25,
              )
            ],
          ),
        ));
      },
      listener: (context, state) {},
    );
  }
}
