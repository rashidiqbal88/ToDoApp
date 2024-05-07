import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TextEditingController stdNamecontrolller = TextEditingController();
  List studentNames = ['Rashid', 'Ali'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: stdNamecontrolller,
        ),
      ),
      body: studentNames.isEmpty
          ? Center(
              child: Text("No dara found"),
            )
          : ListView.builder(
              itemCount: studentNames.length,
              itemBuilder: (BuildContext context, int index) {
                if (studentNames.isEmpty) {
                  return Center(
                    child: Text(
                      "No data found...",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      tileColor: const Color.fromARGB(255, 140, 151, 170),
                      title: Text(
                        '${studentNames[index]}',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            studentNames.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                }
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            studentNames.add(stdNamecontrolller.text);
            stdNamecontrolller.clear();
          });
        },
        child: const Text("Add"),
      ),
    );
  }
}
