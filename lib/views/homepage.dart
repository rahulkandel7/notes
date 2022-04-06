import 'package:flutter/material.dart';
import 'package:notes/model/notes.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();

  List<Notes> notes = [];

  int id = 0;

  String title = '';

  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (value) {
                      id = int.parse(value!);
                    },
                    decoration: InputDecoration(
                      labelText: 'ID',
                      hintText: 'Enter ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (value) {
                        title = value.toString();
                      },
                      decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: 'Enter Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (value) {
                        description = value!;
                      },
                      decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: 'Enter description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.save();

                      setState(() {
                        notes.add(
                          Notes(
                            id: id,
                            title: title,
                            description: description,
                          ),
                        );
                      });
                    },
                    child: Text(
                      'Add',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Text(notes[i].id.toString()),
                  title: Text(notes[i].title),
                  subtitle: Text(
                    notes[i].description,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        notes.removeAt(i);
                      });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              },
              itemCount: notes.length,
            ),
          ),
        ],
      ),
    );
  }
}
