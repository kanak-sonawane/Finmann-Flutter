class AppConstants {
  static const appName = 'FinMann';
  static const dbName = 'finmann.db';
  static const dbVersion = 2;

  static const List<String> expenseCategories = [
    'Food & Dining','Transport','Tuition & Fees','Books & Stationery',
    'Entertainment','Subscriptions','Health','Shopping','Utilities','Other',
  ];

  static const List<String> incomeCategories = [
    'Allowance','Part-time Job','Freelance','Scholarship','Gift','Other',
  ];

  static const Map<String, String> categoryIcons = {
    'Food & Dining': '🍜','Transport': '🚌','Tuition & Fees': '🎓',
    'Books & Stationery': '📚','Entertainment': '🎮','Subscriptions': '📱',
    'Health': '💊','Shopping': '🛍️','Utilities': '💡','Allowance': '💰',
    'Part-time Job': '💼','Freelance': '🖥️','Scholarship': '🏆',
    'Gift': '🎁','Other': '📦',
  };

  static const Map<String, String> categoryColorHex = {
    'Food & Dining': '#00E676','Transport': '#40C4FF',
    'Tuition & Fees': '#E040FB','Books & Stationery': '#FFB300',
    'Entertainment': '#FF6D00','Subscriptions': '#1DE9B6',
    'Health': '#FF4C6A','Shopping': '#F50057',
    'Utilities': '#FFEA00','Other': '#90A4AE',
  };
}
