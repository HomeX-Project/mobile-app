
import 'package:home_x/core/services/services_locator.dart';
import 'package:home_x/core/shared_preference/cache_helper.dart';

void onBoardingVisited() {
  getIt<CacheHelper>()
                      .saveData(key: "isOnBoardingvisited", value: true);
}