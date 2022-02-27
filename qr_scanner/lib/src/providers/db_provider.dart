import 'package:path/path.dart';
import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    print('Entrando por aca');
    _database = await initDB();

    return _database;
  }

  Future<Database?> initDB() async {
    String documentsDirectory = await getDatabasesPath();
    var path = join(documentsDirectory, 'Scans.db');
    print(path);
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) => {},
      onCreate: (Database db, int version) async {
        await db.execute('''
            CREATE TABLE Scans(
              id INTEGER PRIMARY KEY,
              tipo TEXT,
              valor TEXT
            )
      ''');
        print('Tabla creada');
      },
    );
  }

  nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    int? res = await db?.insert('Scans', nuevoScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db?.query('Scans', where: 'id=?', whereArgs: [id]);
    return res!.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>?> getTodosLosScans() async {
    final db = await database;
    if (db != null) {
      final res = await db.query('Scans');
      print(res);
      return res.isNotEmpty
          ? res.map((s) => ScanModel.fromJson(s)).toList()
          : null;
    }
  }

  Future<List<ScanModel>> getScansporTipo(String tipo) async {
    final db = await database;
    if (db != null) {
      final res = await db.query('Scans', where: 'tipo=?', whereArgs: [tipo]);
      return res.isNotEmpty
          ? res.map((s) => ScanModel.fromJson(s)).toList()
          : [];
    }
    return [];
  }

  Future<int?> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db?.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int?> deleteScan(int? id) async {
    final db = await database;
    await db?.delete('Scans', where: 'id=?', whereArgs: [id]);
  }

  Future<int?> deleteAllScans() async {
    final db = await database;
    await db?.rawDelete('''
    DELETE FROM Scans
  ''');
  }
}
