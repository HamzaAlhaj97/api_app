import 'package:api_app/api/todo_api.dart';
import 'package:api_app/models/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoApi todosApi;
  TodosBloc({required this.todosApi}) : super(LoadingState()) {
    on<TodosEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final result = await todosApi.getAllTodos();
        emit(LoadedState(todos: result));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
      }
    });
  }
}
