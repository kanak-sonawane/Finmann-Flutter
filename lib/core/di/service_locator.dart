import 'package:get_it/get_it.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/transaction_repository.dart';
import '../../data/repositories/budget_repository.dart';
import '../../data/repositories/goal_repository.dart';
import '../../presentation/blocs/auth/auth_bloc.dart';
import '../../presentation/blocs/transaction/transaction_bloc.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton(() => AuthRepository());
  sl.registerLazySingleton(() => TransactionRepository());
  sl.registerLazySingleton(() => BudgetRepository());
  sl.registerLazySingleton(() => GoalRepository());

  sl.registerFactory(() => AuthBloc(sl<AuthRepository>()));
  sl.registerFactory(() => TransactionBloc(sl<TransactionRepository>()));
}
