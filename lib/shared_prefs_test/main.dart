import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_prefs/shared_prefs_test/widgets.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// アプリ本体
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

/// ホーム画面
class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // ドリンクを表示
          const EmailText(),
          // ドリンクを編集
          EmailTextField(controller: controller),
          // ドリンクを保存
          EmailSaveButton(controller: controller),
        ],
      ),
    );
  }
}