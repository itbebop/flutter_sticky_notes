import 'package:flutter_sticky_notes/data/note.dart';

class NoteManager {
  // ignore: prefer_final_fields
  List<Note> _notes = [];

  void addNote(Note note) {
    _notes.add(note);
    print('addnote');
    print(_notes);
    print(_notes.length);
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
  }

  Note getNote(int index) {
    return _notes[index];
  }

  List<Note> listNotes() {
    print('list in manager');
    print(_notes);
    print(_notes.length);
    return _notes;
  }

  void updateNote(int index, Note note) {
    _notes[index] = note;
  }
}
