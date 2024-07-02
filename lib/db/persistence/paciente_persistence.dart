import 'package:caresync/db/models/paciente.dart';
import 'package:sqflite/sqflite.dart';

class PacientePersistence {
  static const String createTabelaPaciente = '''
    CREATE TABLE pacientes (
      id TEXT PRIMARY KEY,
      nome TEXT,
      cpf TEXT,
      dataNascimento TEXT
    )
  ''';

  Future<void> insertPaciente(Database db, Paciente paciente) async {
    await db.insert(
      'pacientes',
      paciente.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Paciente?> getPaciente(Database db, String id) async {
    final List<Map<String, dynamic>> maps = await db.query(
      'pacientes',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Paciente.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<void> updatePaciente(Database db, Paciente paciente) async {
    await db.update(
      'pacientes',
      paciente.toJson(),
      where: 'id = ?',
      whereArgs: [paciente.id],
    );
  }

  Future<void> deletePaciente(Database db, String id) async {
    await db.delete(
      'pacientes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Paciente>> getAllPacientes(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query('pacientes');

    return List.generate(maps.length, (i) {
      return Paciente(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        cpf: maps[i]['cpf'],
        dataNascimento: maps[i]['dataNascimento'],
      );
    });
  }
}
