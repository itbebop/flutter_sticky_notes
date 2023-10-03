import 'package:flutter_sticky_notes/data/note_manager.dart';

NoteManager? _noteManager;

NoteManager noteManager() {
  //   if (_noteManager == null) {
  //   _noteManager = NoteManager();
  // }
  // 위와 동일함
  _noteManager ??= NoteManager();
  return _noteManager!;
}
