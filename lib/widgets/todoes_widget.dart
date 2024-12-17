import 'package:api_app/models/todo.dart';
import 'package:flutter/material.dart';

class TodoesWidget extends StatelessWidget {
  const TodoesWidget({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                todos[index].id.toString(),
                style:
                    const TextStyle(color: Color.fromARGB(161, 255, 255, 255)),
              ),
            ),
            title: Text(todos[index].title),
            trailing: todos[index].completed
                ? const Icon(Icons.radio_button_checked, color: Colors.green)
                : const Icon(
                    Icons.radio_button_unchecked,
                    color: Colors.red,
                  ),
          ),
        );
      },
    );
  }
}
