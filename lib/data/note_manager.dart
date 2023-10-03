import 'package:flutter_sticky_notes/data/note.dart';

class NoteManager {
  final List<Note> _notes = [];

  void addNote(Note note) {
    _notes.add(note);
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
  }

  Note getNote(int index) {
    return _notes[index];
  }

  List<Note> listNotes() {
    return _notes;
  }

  void updateNote(int index, Note note) {
    _notes[index] = note;
  }
}