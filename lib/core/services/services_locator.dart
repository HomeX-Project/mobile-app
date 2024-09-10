import 'package:get_it/get_it.dart';
import 'package:home_x/core/shared_preference/cache_helper.dart';
import 'package:home_x/feature/autharization/date/auth_forget_password/auth_cubit.dart';
import 'package:home_x/feature/autharization/date/auth_login/auth_cubit.dart';
import 'package:home_x/feature/autharization/date/auth_register/auth_register_cubit.dart';

final getIt =
                    // create object git it from GitIt Singelton Pattern
                    //  to use all app istead of create object first time
    GetIt.instance; 

final getIt2 =
                    // create object git it from GitIt Singelton Pattern
                    //  to use all app istead of create object first time
    GetIt.instance; 
    final getIt3 =
                    // create object git it from GitIt Singelton Pattern
                    //  to use all app istead of create object first time
    GetIt.instance; 

void setupServicesLocator() {
   getIt.registerSingleton<AppLoginCubit>(AppLoginCubit()); 
    getIt2.registerSingleton<AppRegisterCubit>(AppRegisterCubit()); 
   getIt3.registerSingleton<AppForgetPasswordCubit>(AppForgetPasswordCubit()); 
    getIt.registerSingleton<CacheHelper>(CacheHelper());
    //getIt.registerSingleton()

}
