import 'package:bloc_pratical/practice_2/features/data/data_source.dart';
import 'package:flutter/material.dart';

class AddToPage extends StatefulWidget {
  const AddToPage({super.key});

  @override
  State<AddToPage> createState() => _AddToPageState();
}

class _AddToPageState extends State<AddToPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final UserDataSource userDataSource = UserDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add To'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                hintText: 'Id',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 9,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  userDataSource.postUser(
                      userId: idController.text,
                      title: titleController.text.trim(),
                      body: descriptionController.text.trim());
                },
                child: const Text('Add To'))
          ],
        ),
      ),
    );
  }
}
