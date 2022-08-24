import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {

  CollectionReference notes = FirebaseFirestore.instance.collection("notes");
  int? index;
  String? createdAt;
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: AppStyle.cardSColor[doc['color_id']],
          borderRadius: BorderRadius.circular(8.0)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          doc['note_title'],
          style: AppStyle.mainTitle,
        ),
        
        Text(
          doc['note_content'],
          style: AppStyle.mainContent,maxLines: 1,overflow: TextOverflow.ellipsis,
        ),
      ]),
    ),
  );
}




