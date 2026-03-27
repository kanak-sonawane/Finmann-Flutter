import 'package:equatable/equatable.dart';

enum TransactionType { income, expense }

class TransactionModel extends Equatable {
  final String id;
  final String userId;
  final TransactionType type;
  final double amount;
  final String category;
  final String? description;
  final DateTime date;
  final DateTime createdAt;

  const TransactionModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.amount,
    required this.category,
    this.description,
    required this.date,
    required this.createdAt,
  });

  bool get isExpense => type == TransactionType.expense;
  bool get isIncome => type == TransactionType.income;

  factory TransactionModel.fromMap(Map<String, dynamic> map) => TransactionModel(
        id: map['id'] as String,
        userId: map['user_id'] as String,
        type: map['type'] == 'income'
            ? TransactionType.income
            : TransactionType.expense,
        amount: (map['amount'] as num).toDouble(),
        category: map['category'] as String,
        description: map['description'] as String?,
        date: DateTime.parse(map['date'] as String),
        createdAt: DateTime.parse(map['created_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'type': type == TransactionType.income ? 'income' : 'expense',
        'amount': amount,
        'category': category,
        'description': description,
        'date': date.toIso8601String(),
        'created_at': createdAt.toIso8601String(),
      };

  TransactionModel copyWith({
    String? id,
    String? userId,
    TransactionType? type,
    double? amount,
    String? category,
    String? description,
    DateTime? date,
    DateTime? createdAt,
  }) =>
      TransactionModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        type: type ?? this.type,
        amount: amount ?? this.amount,
        category: category ?? this.category,
        description: description ?? this.description,
        date: date ?? this.date,
        createdAt: createdAt ?? this.createdAt,
      );

  @override
  List<Object?> get props => [id, userId, type, amount, category, date];
}
