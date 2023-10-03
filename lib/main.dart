import 'package:flutter/material.dart';
import 'package:flutter_sticky_notes/page/note_edit_page.dart';
import 'package:flutter_sticky_notes/page/note_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sticky Notes',
      theme: ThemeData(
        // 테마색상
        primarySwatch: Colors.teal,
      ),
      // home: const NoteListPage(),
      // initialRoute는 home과 같이 쓸 수 없음
      initialRoute: NoteListPage.routeName,
      routes: {
        NoteListPage.routeName: (context) => const NoteListPage(),
        NoteEditPage.routeName: (context) => const NoteEditPage(),
      },
    );
  }
}
