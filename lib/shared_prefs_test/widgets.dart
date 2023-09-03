import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_prefs/shared_prefs_test/state.dart';

// テキスト
class EmailText extends ConsumerWidget {
  const EmailText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 状態管理からデータを取得
    final email = ref.watch(emailNotifierProvider);
    // AsyncDataが返ってくるのでswitch式で分ける
    return switch (email) {
      // データがあるとき
      AsyncData(:final value) => Text(value),
      // データがないとき
      AsyncValue() => const CircularProgressIndicator(),
    };
  }
}

// テキストフィールド
class EmailTextField extends ConsumerWidget {
  const EmailTextField({
    super.key,
    required this.controller,
  });

  // テキスト編集コントローラー
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 状態管理からデータを取得
    final email = ref.watch(emailNotifierProvider);
    // AsyncDataが返ってくるのでswitch式で分ける
    return switch (email) {
    AsyncData(:final value) =>
        TextField(controller: controller..text = value),
    AsyncValue() => const CircularProgressIndicator(),
    };
  }
}

// 保存ボタン
class EmailSaveButton extends ConsumerWidget {
  const EmailSaveButton({
    super.key,
    required this.controller,
  });

  // テキスト編集コントローラー
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ボタン
    return ElevatedButton(
      onPressed: () {
        // 押されたときにコントローラーから入力された文字をGET
        final email = controller.text;
        // ノティファイアーで状態を変更
        final notifier = ref.read(emailNotifierProvider.notifier);
        notifier.updateEmail(email);
      },
      child: const Text('保存する'),
    );
  }
}