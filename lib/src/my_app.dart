import 'package:counter_cubit/src/controller/counter_cubit.dart';
import 'package:counter_cubit/src/cubit/post_fetch_cubit.dart';
import 'package:counter_cubit/src/repository/api_repository.dart';
import 'package:counter_cubit/src/service/api_service.dart';
import 'package:counter_cubit/src/view/to_dos_page.dart';
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
      ],
      child: MaterialApp(
        title: 'Cubit Practice',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: const ToDosPage(title: 'Api Fetch With Cubit'),
      ),
    );
  }
}
