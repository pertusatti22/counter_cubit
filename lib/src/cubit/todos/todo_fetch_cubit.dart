import 'package:bloc/bloc.dart';
import 'package:counter_cubit/src/models/failure_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';
import '../../repository/api_repository.dart';

part 'todo_fetch_state.dart';

class TodoFetchCubit extends Cubit<TodoFetchState> {
  final ApiRepository apiRepository;

  TodoFetchCubit({required this.apiRepository})
      : super(
          TodoFetchInitial(),
        );

  Future<void> fetchTodosApi() async {
    emit(TodoFetchLoading());
    try {
      final List<Todo>? todoList = await apiRepository.getTodoList();
      emit(TodoFetchLoaded(todoList: todoList ?? []));
    } on Failure catch (err) {
      emit(TodoFetchError(failure: err));
    } catch (e) {
      print(e);
    }
  }
}
