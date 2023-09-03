import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'kv.dart';
part 'state.g.dart';

// ドリンクの状態管理

@riverpod
class EmailNotifier extends _$EmailNotifier {
  @override
  Future<String> build() async {
    // KV から取り出す
    return loadEmail(); // 最初のデータ
  }

  // メールアドレスを変更
  Future<void> updateEmail(String email) async {
    // KV に保存
    await saveEmail(email);
    // 状態を変更
    state = AsyncData(email);
  }
}