import 'package:caresync/db/models/sinais_vitais.dart';
import 'package:sqflite/sqflite.dart';

class SinaisVitaisPersistence {
  static const String createTabelaSinaisVitais = '''
      CREATE TABLE sinais_vitais(
        id TEXT PRIMARY KEY ,
        idPaciente TEXT,
        idProfissional TEXT,
        freqCardiaca INTEGER,
        freqRespiratoria INTEGER,
        pressaoArterial TEXT,
        constipacao TEXT,
        glicemia REAL,
        temperatura REAL,
        oxigenacao REAL,
        peso REAL,
        mobilidade TEXT,
        observacoes TEXT
      )
    ''';

  Future<int> insertSinaisVitais(Database db, SinaisVitais sinaisVitais) async {
    return await db.insert('sinais_vitais', sinaisVitais.toMap());
  }

  Future<List<SinaisVitais>> getAllSinaisVitais(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query('sinais_vitais');
    return List.generate(maps.length, (i) {
      return SinaisVitais.fromMap(maps[i]);
    });
  }
}
