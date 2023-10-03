import 'package:flutter/material.dart';
import 'package:flutter_sticky_notes/page/note_edit_page.dart';
import 'package:flutter_sticky_notes/providers.dart';

class NoteViewPage extends StatefulWidget {
  const NoteViewPage(this.index, {super.key});

  static const routeName = '/view';

  final int index;

  @override
  State<NoteViewPage> createState() => _NoteViewPageState();
}

class _NoteViewPageState extends State<NoteViewPage> {
  @override
  Widget build(BuildContext context) {
    // widget.index는 note_view_page의 인덱스 정보
    final note = noteManager().getNote(widget.index);
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title.isEmpty ? '(제목없음)' : note.title),
        actions: [
          IconButton(
            onPressed: () {
              _edit(widget.index);
            },
            icon: const Icon(Icons.edit),
            tooltip: '편집',
          ),
          IconButton(
            onPressed: () {
              _confirmDelete(widget.index);
            },
            icon: const Icon(Icons.delete),
            tooltip: '삭제',
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Container(
          color: note.color,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Text(note.body),
          ),
        ),
      ),
    );
  }

  void _edit(int index) {
    Navigator.pushNamed(
      context,
      NoteEditPage.routeName,
      arguments: index,
    ).then(
      // update후에 list화면으로 이동
      (value) => setState(() {}),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('노트 삭제'),
          content: const Text('노트를 삭제할까요'),
          actions: [
            TextButton(
              child: const Text('아니오'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('예'),
              onPressed: () {
                noteManager().deleteNote(index);
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        );
      },
    );
  }
}
