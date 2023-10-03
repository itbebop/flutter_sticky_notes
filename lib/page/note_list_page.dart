import 'package:flutter/material.dart';
import 'package:flutter_sticky_notes/data/note.dart';
import 'package:flutter_sticky_notes/data/note_manager.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sticky_Notes'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        children: _buildCards(),
      ),
    );
  }

  // notes 여러 개 반환
  List<Widget> _buildCards() {
    return NoteManager().listNotes().map((note) => _buildCard(note)).toList();
  }

  // note 그려주는 위젯
  Widget _buildCard(Note note) {
    return Card(
      color: note.color,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title.isEmpty ? '(제목 없음)' : note.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child: Text(
              note.body,
              overflow: TextOverflow.fade,
            )),
          ],
        ),
      ),
    );
  }
}
