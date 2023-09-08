import 'package:ecommerce/ecommerce/Catalog.dart';
import 'package:ecommerce/ecommerce/addToCart.dart';
import 'package:ecommerce/ecommerce/cubit/cubit/sales_cubit.dart';
import 'package:ecommerce/signUp/cubit/sign_up_cubit.dart';
import 'package:ecommerce/splash/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'bloc_observer.dart';
import 'ecommerce/HiveData.dart';
import 'ecommerce/homeScreen.dart';
import 'helper/dio_helper.dart';
import 'language_cubit/language_cubit.dart';
import 'login/cubit/login_cubit.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  DioHelper.init();
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.BoxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale("en"),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: MyHomePage(),
      ),
    );
  }
}
