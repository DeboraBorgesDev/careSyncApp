import 'package:caresync/db/persistence/usuario_persistence.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  print('abrindo conexao com o banco');

  return openDatabase(
    join(await getDatabasesPath(), 'testeappnovo.db'),
    onCreate: (db, version) async {
      List<String> queries = [
        UsuarioPersistence.createTabelaUsuario,
      ];

      print('getDatabasesPath(): ${await getDatabasesPath()}');
      for (String sql in queries) {
        print('sql: $sql');
        await db.execute(sql);
      }
    },
    version: 1,
  );
}
