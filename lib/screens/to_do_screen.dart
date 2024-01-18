import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment_one/components/text_field_custom.dart';
import 'package:state_managment_one/cubit/to-do_cubit.dart';
import 'package:state_managment_one/cubit/to_do_state.dart';
import 'package:state_managment_one/utils/text_style.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.yellow.shade700,
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => BlocConsumer<ToDoCubit, ToDoState>(
                listener: (context, state) {
                  var cubit = ToDoCubit.get(context);
                  if (state is AddTask) {
                    cubit.titleController.clear();
                    cubit.dateController.clear();
                    cubit.timeController.clear();
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  var cubit = ToDoCubit.get(context);
                  return const AlertDialog(
                    backgroundColor: Colors.black,
                    content: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 450,
                        width: 400,
                        child: TeField(),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          bottom: const TabBar(
            labelColor: Colors.white,
            labelStyle: AppTextStyle.barText,
            dividerHeight: 0,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                text: 'Tasks',
              ),
              Tab(
                text: 'Done',
              ),
              Tab(
                text: 'Archive',
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text(
            'To Do App',
            style: AppTextStyle.barText,
          ),
        ),
        body: BlocConsumer<ToDoCubit, ToDoState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ToDoCubit.get(context);
            return GridView.count(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              mainAxisSpacing: 10,
              crossAxisCount: 1,
              childAspectRatio: 10 / 3,
              children: List.generate(
                cubit.taskModel.length,
                (index) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow.shade700, width: 2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
