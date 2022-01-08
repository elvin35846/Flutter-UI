import 'package:flutter/material.dart';
import 'package:tasks_app/models/task.dart';

class Tasks extends StatelessWidget {
  Tasks({Key? key}) : super(key: key);

  final tasksList = Task.taskGenerate();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, index) =>
            tasksList[index].isLast == true
                ? _buildAddTask()
                : _buildTask(context, tasksList[index]),
      ),
    );
  }

  Widget _buildAddTask() {
    return const Text('Add task');
  }

  Widget _buildTask(BuildContext context, Task task) {
    return const Text('Task');
  }
}
