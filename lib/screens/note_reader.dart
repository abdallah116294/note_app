


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/style/app_style.dart';

class NoteScreenReader extends StatefulWidget {
   NoteScreenReader(this.doc,{Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteScreenReader> createState() => _NoteScreenReaderState();
}

class _NoteScreenReaderState extends State<NoteScreenReader> {
  @override
  Widget build(BuildContext context) {
    int color_id=widget.doc['color_id'];
  return  Scaffold(
    backgroundColor: AppStyle.cardSColor[color_id],
    appBar: AppBar(
      backgroundColor: AppStyle.cardSColor[color_id],
      elevation: 0.0,
    ),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
             widget. doc['note_title'],
              style: AppStyle.mainTitle,
            ),
            //    Text(
            //  widget. doc['createdAt'],
            //   style: AppStyle.mainTitle,
            // ),
           const SizedBox(height: 20,),
            Text(
            widget.doc['note_content'],
              style: AppStyle.mainContent,
            ),
          ]),
      ),
    ),
  );
  }
}