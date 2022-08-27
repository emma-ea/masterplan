import 'package:get_it/get_it.dart';

import '../repositories/in_memory_cache.dart';
import '../repositories/repository.dart';
import '../controllers/plan_controller.dart';
import '../services/plan_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Repository>(InMemoryCache());
  locator.registerFactory(() => PlanServices());
  locator.registerFactory(() => PlanController());
}

