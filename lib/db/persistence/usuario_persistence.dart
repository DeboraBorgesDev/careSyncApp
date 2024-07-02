import 'package:sqflite/sqflite.dart';

import '../models/usuario.dart';

class UsuarioPersistence {
  static const String createTabelaUsuario = '''
    CREATE TABLE usuarios (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      email TEXT,
      senha TEXT,
      token TEXT
    )
  ''';

  Future<void> insertUser(Database db, User user) async {
    await db.insert(
      'usuarios',
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<User?> getUser(Database db, int id) async {
    final List<Map<String, dynamic>> maps = await db.query(
      'usuarios',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<void> updateUser(Database db, User user) async {
    await db.update(
      'usuarios',
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUser(Database db, int id) async {
    await db.delete(
      'usuarios',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
