import 'package:counter_cubit/src/cubit/todos/todo_fetch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';

class TodosPage extends StatelessWidget {
  final String title;

  const TodosPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<TodoFetchCubit, TodoFetchState>(
        builder: (context, state) {
          if (state is TodoFetchLoading) {
            return const CircularProgressIndicator();
          } else if (state is TodoFetchError) {
            return Text(state.failure.message);
          } else if (state is TodoFetchLoaded) {
            final postList = state.todoList;
            return postList.isEmpty
                ? const Text('No any posts')
                : ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      final Todo singleTodo = postList[index];
                      return Card(
                        child: ListTile(
                          leading: Checkbox(
                            value: singleTodo.completed,
                            onChanged: (bool? value) {},
                          ),
                          title: Text(singleTodo.title),
                          subtitle: Text(singleTodo.userId.toString()),
                        ),
                      );
                    },
                  );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
