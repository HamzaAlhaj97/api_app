import 'package:api_app/api/todo_api.dart';
import 'package:api_app/pages/todoes_page.dart';
import 'package:api_app/todos_v2/todos_v2_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_app/helpers/my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosV2Bloc(todosApi: TodoApi())..add(const TodosV2Event.getAllTodos()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todoes App',
        home: TodoesPage(),
      ),
    );
  }
}
