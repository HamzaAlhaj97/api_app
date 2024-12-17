import 'package:api_app/api/todo_api.dart';
import 'package:api_app/models/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todos_v2_state.dart';
part 'todos_v2_event.dart';
part 'todos_v2_bloc.freezed.dart';

class TodosV2Bloc extends Bloc<TodosV2Event, TodosV2State> {
  TodoApi todosApi = TodoApi();
  TodosV2Bloc({required this.todosApi}) : super(const TodosV2State.loading()) {
    on<TodosV2Event>((event, emit) async {
      await event.when(
        getAllTodos: () async {
          emit(const TodosV2State.loading());
      try {
        final result = await todosApi.getAllTodos();
        emit(TodosV2State.loaded(result));
      } catch (e) {
        emit(TodosV2State.error(e.toString()));
      }
        },
      );
    });
  }
}
