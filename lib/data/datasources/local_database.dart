import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../core/constants/app_constants.dart';

class LocalDatabase {
  static Database? _db;

  static Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, AppConstants.dbName);
    return openDatabase(path, version: AppConstants.dbVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE users (
      id TEXT PRIMARY KEY, email TEXT UNIQUE NOT NULL, name TEXT NOT NULL,
      password_hash TEXT NOT NULL, currency TEXT DEFAULT '₹', created_at TEXT NOT NULL)''');

    await db.execute('''CREATE TABLE transactions (
      id TEXT PRIMARY KEY, user_id TEXT NOT NULL, type TEXT NOT NULL,
      amount REAL NOT NULL, category TEXT NOT NULL, description TEXT,
      date TEXT NOT NULL, created_at TEXT NOT NULL,
      FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE)''');

    await db.execute('''CREATE TABLE budgets (
      id TEXT PRIMARY KEY, user_id TEXT NOT NULL, category TEXT NOT NULL,
      limit_amount REAL NOT NULL, month INTEGER NOT NULL, year INTEGER NOT NULL,
      UNIQUE(user_id, category, month, year))''');

    await db.execute('''CREATE TABLE goals (
      id TEXT PRIMARY KEY, user_id TEXT NOT NULL, name TEXT NOT NULL,
      emoji TEXT DEFAULT '🎯', target_amount REAL NOT NULL, saved_amount REAL DEFAULT 0,
      deadline TEXT, created_at TEXT NOT NULL)''');

    await db.execute('CREATE INDEX idx_tx_user_date ON transactions(user_id, date DESC)');
  }

  static Future<void> _onUpgrade(Database db, int oldV, int newV) async {
    if (oldV < 2) {
      await db.execute('''CREATE TABLE IF NOT EXISTS budgets (
        id TEXT PRIMARY KEY, user_id TEXT NOT NULL, category TEXT NOT NULL,
        limit_amount REAL NOT NULL, month INTEGER NOT NULL, year INTEGER NOT NULL,
        UNIQUE(user_id, category, month, year))''');
      await db.execute('''CREATE TABLE IF NOT EXISTS goals (
        id TEXT PRIMARY KEY, user_id TEXT NOT NULL, name TEXT NOT NULL,
        emoji TEXT DEFAULT '🎯', target_amount REAL NOT NULL, saved_amount REAL DEFAULT 0,
        deadline TEXT, created_at TEXT NOT NULL)''');
    }
  }
}
