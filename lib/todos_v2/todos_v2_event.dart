part of 'todos_v2_bloc.dart';

@freezed
class TodosV2Event with _$TodosV2Event {
  const factory TodosV2Event.getAllTodos() = _GetAllTodos;
}
