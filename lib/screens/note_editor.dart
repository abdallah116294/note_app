import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/style/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  @override
String createdAt=DateTime.now().toString();
  int color_id = Random().nextInt(AppStyle.cardSColor.length);
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardSColor[color_id],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppStyle.cardSColor[color_id],
        elevation: 0.0,
        title: const Text(
          'Add a nw note',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  hintText: 'Note Titel', border: InputBorder.none),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  hintText: 'Note content ', border: InputBorder.none),
            ),
            SizedBox(height: 10,),
            Text(createdAt,style: TextStyle(color: Colors.black
            ,fontSize:20 ,fontWeight: FontWeight.w600 ),)
             
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () {
          notes.add({
            "note_content": _mainController.text,
            "note_title": _titleController.text,
            "color_id": color_id,
            // "CreatedAt":createdAt
          }).then((value) {
            Navigator.pop(context);
          }).catchError((error) {
            print('Faild to add it ');
          });
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
