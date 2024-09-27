import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoappstatenotifier/pages/todos_provider.dart';

class TodosPage extends ConsumerWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider).todos;
    print(todos);

    TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Column(
        children: [
          const Addtodo(),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: ListView(
            children: [
              for (final todo in todos)
                CheckboxListTile(
                  value: todo.completed,
                  onChanged: (value) {
                    ref.read(todosProvider.notifier).toffleTodo(todo.id);
                  },
                  title: Text(todo.decs),
                  secondary: IconButton(
                      onPressed: () {
                        ref.read(todosProvider.notifier).removeTodo(todo.id);
                      },
                      icon: const Icon(Icons.delete)),
                  controlAffinity: ListTileControlAffinity.leading,
                  // subtitle: TextField(
                  //   controller: textEditingController,
                  //   decoration: const InputDecoration(labelText: 'Update to'),
                  //   onSubmitted: (desc) {
                  //     if (desc.isNotEmpty) {
                  //       ref.read(todosProvider.notifier).updateTodo(todo.id, textEditingController.text);
                  //       textEditingController.clear();
                  //     }
                  //   },
                  // ),
                ),
            ],
          ))
        ],
      ),
    );
  }
}

class Addtodo extends ConsumerStatefulWidget {
  const Addtodo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddtodoState();
}

class _AddtodoState extends ConsumerState<Addtodo> {
  final textCon = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    textCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: textCon,
        decoration: const InputDecoration(labelText: 'New Todo'),
        onSubmitted: (desc) {
          if (desc.isNotEmpty) {
            ref.read(todosProvider.notifier).addTodo(desc);
            textCon.clear();
          }
        },
      ),
    );
  }
}
