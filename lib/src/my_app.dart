import 'package:counter_cubit/src/cubit/counter/counter_cubit.dart';
import 'package:counter_cubit/src/cubit/posts/post_fetch_cubit.dart';
import 'package:counter_cubit/src/cubit/todos/todo_fetch_cubit.dart';
import 'package:counter_cubit/src/repository/api_repository.dart';
import 'package:counter_cubit/src/service/api_service.dart';
import 'package:counter_cubit/src/view/todos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.apiService});

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<PostFetchCubit>(
          create: (context) => PostFetchCubit(
            apiRepository: ApiRepository(
              apiService: apiService,
            ),
          )..fetchPostsApi(),
        ),
        BlocProvider<TodoFetchCubit>(
          create: (context) => TodoFetchCubit(
            apiRepository: ApiRepository(
              apiService: apiService,
            ),
          )..fetchTodosApi(),
        ),
      ],
      child: MaterialApp(
        title: 'Cubit Practice',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        //home: const PostsPage(title: 'Api Fetch With Cubit'),
        home: const TodosPage(title: 'Todo Api with Cubit'),
      ),
    );
  }
}
