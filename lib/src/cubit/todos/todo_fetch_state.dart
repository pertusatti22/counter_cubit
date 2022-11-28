part of 'todo_fetch_cubit.dart';

abstract class TodoFetchState extends Equatable {
  const TodoFetchState();

  @override
  List<Object> get props => [];
}

class TodoFetchInitial extends TodoFetchState {}

class TodoFetchLoading extends TodoFetchState {}

class TodoFetchLoaded extends TodoFetchState {
  final List<Todo> todoList;

  const TodoFetchLoaded({
    required this.todoList,
  });

  @override
  List<Object> get props => [todoList];
}

class TodoFetchError extends TodoFetchState {
  final Failure failure;

  const TodoFetchError({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
