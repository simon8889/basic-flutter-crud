import 'package:sqflite/sqflite.dart';
import '../database/database_helper.dart';
import '../models/persona.dart';

class PersonaRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<int> insertar(Persona persona) async {
    final db = await _dbHelper.database;
    return await db.insert(
      DatabaseHelper.tablePersonas,
      persona.toMap(),
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  Future<List<Persona>> obtenerTodas() async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      DatabaseHelper.tablePersonas,
      orderBy: 'nombre ASC',
    );
    return maps.map((map) => Persona.fromMap(map)).toList();
  }

  Future<Persona?> obtenerPorId(int id) async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      DatabaseHelper.tablePersonas,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isEmpty) return null;
    return Persona.fromMap(maps.first);
  }

  Future<int> actualizar(Persona persona) async {
    final db = await _dbHelper.database;
    return await db.update(
      DatabaseHelper.tablePersonas,
      persona.toMap(),
      where: 'id = ?',
      whereArgs: [persona.id],
    );
  }

  Future<int> eliminar(int id) async {
    final db = await _dbHelper.database;
    return await db.delete(
      DatabaseHelper.tablePersonas,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}