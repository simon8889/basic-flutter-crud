import 'package:sqflite/sqflite.dart';
import '../database/database_helper.dart';
import '../models/persona.dart';

class PersonaRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<int> insertar(Persona persona) async {
    final db = await _dbHelper.database;
    try {
      return await db.insert(
        DatabaseHelper.tablePersonas,
        persona.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
    } catch (e) {
      if (e.toString().contains('UNIQUE constraint failed')) {
        throw Exception('Ya existe una persona con ese número de documento');
      }
      throw Exception('Error al insertar: $e');
    }
  }

  Future<List<Persona>> obtenerTodas() async {
    final db = await _dbHelper.database;
    try {
      final maps = await db.query(DatabaseHelper.tablePersonas);
      return maps.map((map) => Persona.fromMap(map)).toList();
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<Persona?> obtenerPorId(int id) async {
    final db = await _dbHelper.database;
    try {
      final maps = await db.query(
        DatabaseHelper.tablePersonas,
        where: 'id = ?',
        whereArgs: [id],
        limit: 1,
      );
      if (maps.isEmpty) return null;
      return Persona.fromMap(maps.first);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<List<Persona>> buscar(String query) async {
    final db = await _dbHelper.database;
    try {
      final maps = await db.query(
        DatabaseHelper.tablePersonas,
        where: 'nombre_completo LIKE ? OR numero_documento LIKE ?',
        whereArgs: ['%$query%', '%$query%'],
      );
      return maps.map((map) => Persona.fromMap(map)).toList();
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<int> actualizar(Persona persona) async {
    final db = await _dbHelper.database;
    try {
      return await db.update(
        DatabaseHelper.tablePersonas,
        persona.toMap(),
        where: 'id = ?',
        whereArgs: [persona.id],
      );
    } catch (e) {
      throw Exception('Error al actualizar: $e');
    }
  }

  Future<int> eliminar(int id) async {
    final db = await _dbHelper.database;
    try {
      return await db.delete(
        DatabaseHelper.tablePersonas,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception('Error al eliminar: $e');
    }
  }

  Future<int> contar() async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM ${DatabaseHelper.tablePersonas}',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }
}