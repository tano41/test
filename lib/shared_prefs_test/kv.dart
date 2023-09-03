import 'package:shared_preferences/shared_preferences.dart';

// メールアドレスを保存する
Future<void> saveEmail(String email) async {
  // web用の保存場所を定義
  const String localStorageKey = "localStorageKey";
  // SharedPreferencesのインスタンスを生成
  final prefs = await SharedPreferences.getInstance();
  // keyとvalueを保存
  await prefs.setString(localStorageKey, email);
}

// メールアドレスを取り出す
Future<String> loadEmail() async {
  // web用の保存場所を定義
  const String localStorageKey = "localStorageKey";
  // SharedPreferencesのインスタンスを生成
  final prefs = await SharedPreferences.getInstance();
  // keyで取り出す
  final email = prefs.getString(localStorageKey);

  return email ?? "登録なし";
}