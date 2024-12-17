import 'package:api_app/todos_v2/todos_v2_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Text(
              message,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<TodosV2Bloc>().add(const TodosV2Event.getAllTodos());
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
