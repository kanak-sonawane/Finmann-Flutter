import 'package:uuid/uuid.dart';
import '../datasources/local_database.dart';
import '../models/user_model.dart';

class AuthRepository {
  final _uuid = const Uuid();

  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final db = await LocalDatabase.database;

    final existing = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );
    if (existing.isNotEmpty) throw Exception('Email already registered.');

    final user = UserModel(
      id: _uuid.v4(),
      email: email.toLowerCase(),
      name: name,
      createdAt: DateTime.now(),
    );

    await db.insert('users', {
      ...user.toMap(),
      'password_hash': _simpleHash(password),
    });

    return user;
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final db = await LocalDatabase.database;
    final rows = await db.query(
      'users',
      where: 'email = ? AND password_hash = ?',
      whereArgs: [email.toLowerCase(), _simpleHash(password)],
    );
    if (rows.isEmpty) throw Exception('Invalid email or password.');
    return UserModel.fromMap(rows.first);
  }

  // Naive hash — for a real app use bcrypt or similar
  String _simpleHash(String input) {
    var hash = 0;
    for (var i = 0; i < input.length; i++) {
      hash = (hash << 5) - hash + input.codeUnitAt(i);
      hash &= hash;
    }
    return hash.toRadixString(16);
  }
}
