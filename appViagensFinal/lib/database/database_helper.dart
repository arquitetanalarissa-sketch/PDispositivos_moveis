import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/viagem_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('viagens.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // Cria a tabela no banco de dados
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE viagens (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        destino TEXT NOT NULL,
        data TEXT NOT NULL,
        orcamento REAL NOT NULL,
        concluida INTEGER NOT NULL
      )
    ''');
  }

  // --- OPERAÇÕES CRUD ---

  // Create (Salvar nova viagem)
  Future<int> inserirViagem(Viagem viagem) async {
    final db = await instance.database;
    return await db.insert('viagens', viagem.toMap());
  }

  // Read (Listar todas as viagens)
  Future<List<Viagem>> listarViagens() async {
    final db = await instance.database;
    final result = await db.query('viagens', orderBy: 'id DESC');
    return result.map((json) => Viagem.fromMap(json)).toList();
  }

  // Update (Atualizar viagem)
  Future<int> atualizarViagem(Viagem viagem) async {
    final db = await instance.database;
    return await db.update(
      'viagens',
      viagem.toMap(),
      where: 'id = ?',
      whereArgs: [viagem.id],
    );
  }

  // Delete (Apagar viagem)
  Future<int> deletarViagem(int id) async {
    final db = await instance.database;
    return await db.delete(
      'viagens',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
