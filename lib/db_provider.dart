import 'package:path/path.dart';
import 'package:practic/todo_item.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  Future<Database> _database;

  Future<Database> get database => _database ??= _init();
  //Запись в БД
  Future<void> insertItem(TodoItem item) async {
    final db = await database;
    await db.insert(
      'items',
      item.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Чтение в БД
  Future<List<TodoItem>> readItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('items');
    return maps.map((e) => TodoItem.fromJson(e)).toList();
  }

  //Открытие БД или создание если ее нет
  Future<Database> _init() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'db_provider.db'),
      onCreate: (Database db, version) {
        return db.execute(
          'CREATE TABLE items('
          'checked INTEGER, '
          '"text" TEXT'
          ')',
        );
      },
      version: 1,
    );
    return database;
  }
}
