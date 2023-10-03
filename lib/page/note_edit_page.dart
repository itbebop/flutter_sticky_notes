import 'package:flutter/material.dart';
import 'package:flutter_sticky_notes/data/note.dart';
import 'package:flutter_sticky_notes/data/note_manager.dart';

class NoteEditPage extends StatefulWidget {
  const NoteEditPage({super.key});

  @override
  State<NoteEditPage> createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  final titleController = TextEditingController();

  final bodyController = TextEditingController();

  Color color = Note.colorDefault;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('노트 편집'),
        actions: [
          IconButton(
            onPressed: _displayColorSelectionDialog,
            icon: const Icon(Icons.color_lens),
            tooltip: '배경색 선택',
          ),
          IconButton(
            onPressed: _saveNote,
            icon: const Icon(Icons.save),
            tooltip: '저장',
          )
        ],
      ),
      body: Container(
        color: color,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  // 외각선 표시
                  border: OutlineInputBorder(),
                  labelText: '제목 입력',
                ),
                maxLines: 1,
                style: const TextStyle(fontSize: 20),
                controller: titleController,
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '노트입력',
                ),
                // 입력하는 줄 수에 따라서 유동적으로 늘어남
                maxLines: null,
                // enter 누르면 다음 줄로 넘어감
                keyboardType: TextInputType.multiline,
                controller: bodyController,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _displayColorSelectionDialog() {
    // 가상키보드가 올라오지 않도록
    FocusManager.instance.primaryFocus?.unfocus();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('배경색 선택'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 선택할 수 있는 항목 표시
              ListTile(
                title: const Text('없음'),
                onTap: () => _applyColor(Note.colorDefault),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Note.colorRed,
                ),
                title: const Text('빨간색'),
                onTap: () => _applyColor(Note.colorRed),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Note.colorOrange,
                ),
                title: const Text('오렌지색'),
                onTap: () => _applyColor(Note.colorOrange),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Note.colorYellow,
                ),
                title: const Text('노란색'),
                onTap: () => _applyColor(Note.colorYellow),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Note.colorLime,
                ),
                title: const Text('연두색'),
                onTap: () => _applyColor(Note.colorLime),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Note.colorBlue,
                ),
                title: const Text('파란색'),
                onTap: () => _applyColor(Note.colorBlue),
              ),
            ],
          ),
        );
      },
    );
  }

  void _applyColor(Color newColor) {
    setState(() {
      Navigator.pop(context);
      color = newColor;
    });
  }

  void _saveNote() {
    if (bodyController.text.isNotEmpty) {
      NoteManager().addNote(
        Note(
          bodyController.text,
          title: titleController.text,
          color: color,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('노트를 입력하세요.'),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
