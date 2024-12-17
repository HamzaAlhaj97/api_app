import 'package:api_app/todos_v2/todos_v2_bloc.dart';
import 'package:api_app/widgets/error_widget.dart';
import 'package:api_app/widgets/loading_widget.dart';
import 'package:api_app/widgets/todoes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoesPage extends StatelessWidget {
  const TodoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todoes'),
      ),
      body: BlocBuilder<TodosV2Bloc, TodosV2State>(
        builder: (context, state) {
          return state.when(
            loading: () => const LoadingWidget(),
            loaded: (todo) => TodoesWidget(todos: todo),
            error: (message) => MyErrorWidget(message: message),
          );
        },
      ),

      /* BlocBuilder<TodosV2Bloc, TodosV2State>(
        builder: (context, state) {
          return state.when(
            loading: () => const LoadingWidget(),
            loaded: (todos) => TodoesWidget(todos: todos),
            error: (message) => MyErrorWidget(message: message,),
          );
        },
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if (state is LoadingState){
            return const LoadingWidget();
          }else if (state is LoadedState){
            return TodoesWidget(todos: state.todos);
          }else if (state is ErrorState) {
            return MyErrorWidget(message: state.message);
          }else {
            return const SizedBox();
          }
        },
      )*/
    );
  }
}
