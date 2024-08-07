import 'dart:async';
import 'package:caresync/db/database.dart';
import 'package:http/http.dart' as http;


class ApiClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    return _inner.send(await _addToken(request));
  }

  Future<http.BaseRequest> _addToken(http.BaseRequest request) async {
    final token = await getToken();
    return request..headers['Authorization'] = 'Bearer $token';
  }

  Future<String?> getToken() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('usuarios', limit: 1);
    if (maps.isNotEmpty) {
      return maps.first['token'] as String?;
    } else {
      return null;
    }
  }
}
