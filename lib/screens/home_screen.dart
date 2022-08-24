import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/screens/note_editor.dart';
import 'package:notes_app/screens/note_reader.dart';
import 'package:notes_app/style/app_style.dart';

import '../widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



CollectionReference notes = FirebaseFirestore.instance.collection('notes');
int? index;
QueryDocumentSnapshot? doc;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Note'),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Your recent Notes',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: notes.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: snapshot.data!.docs
                            .map((notes) => noteCard(() {
                              
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NoteScreenReader(notes)));
                                }, notes))
                            .toList(),
                      );
                    }
                    return Text(
                      'ther \'s no Notes ',
                      style: GoogleFonts.nunito(color: Colors.white),
                    );
                  },
                ),
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Add note'),
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NoteEditorScreen(),
                ));
          }),
    );
  }
}
